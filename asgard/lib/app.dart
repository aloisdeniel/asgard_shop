import 'package:asgard/features/account/state.dart';
import 'package:asgard/features/cart/state.dart';
import 'package:asgard/features/catalog/view.dart';
import 'package:asgard_core/asgard_core.dart';
import 'package:go_router/go_router.dart';

import 'base/state_provider.dart';
import 'features/product_detail/view.dart';

class App extends StatelessWidget {
  App({
    Key? key,
  }) : super(key: key);

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CatalogView(),
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) => const ProductDetailView(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return StateProvider<CartState, CartNotifier>(
      create: (context) => CartNotifier.demo(),
      child: StateProvider<AccountState, AccountNotifier>(
        create: (context) => AccountNotifier.demo(),
        child: AppBase(
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          title: 'Asgard',
        ),
      ),
    );
  }
}
