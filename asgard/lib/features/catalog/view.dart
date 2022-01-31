import 'dart:math' as math;

import 'package:asgard/base/state_provider.dart';
import 'package:asgard/services/services.dart';
import 'package:asgard_core/asgard_core.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'state.dart';
import 'widgets/header.dart';
import 'widgets/navigation_bar.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateProvider<CatalogState, CatalogNotifier>(
      create: (context) => CatalogNotifier.demo(),
      child: const CatalogMobileLayout(),
    );
  }
}

class CatalogMobileLayout extends StatelessWidget {
  const CatalogMobileLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = context.select((CatalogState state) => state.products);
    return AppScaffold(
      body: _BodyWithProducts(
        products: products,
      ),
      floatingBar: const CatalogNavigationBar(),
    );
  }
}

class _BodyWithProducts extends StatefulWidget {
  const _BodyWithProducts({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  State<_BodyWithProducts> createState() => _BodyWithProductsState();
}

class _BodyWithProductsState extends State<_BodyWithProducts> {
  late final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = AppTheme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return CustomScrollView(
        controller: _controller,
        slivers: [
          SliverToBoxAdapter(
            child: CatalogHeader(
              controller: _controller,
            ),
          ),
          AppTileSliverGrid(
            padding: EdgeInsets.only(
              left: theme.spacing.semiBig,
              top: theme.spacing.semiBig,
              right: theme.spacing.semiBig,
              bottom: math.max(
                mediaQuery.padding.bottom,
                theme.spacing.semiBig,
              ),
            ),
            crossAxisCount: (constraints.maxWidth / 200).ceil(),
            children: [
              ...widget.products.map(
                (product) => ProductTile(
                  key: Key(product.id),
                  name: product.name,
                  image: NetworkImage(product.image),
                  price: product.price.toDouble(),
                  aspectRatio: product.imageAspectRatio,
                  onTap: () {
                    print('product tapped!');
                    context.push('/detail');
                  },
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
