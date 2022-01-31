import 'package:asgard_core/asgard_core.dart';

import 'widgets/navigation_bar.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: SizedBox(),
      floatingBar: ProductDetailNavigationBar(),
    );
  }
}
