import 'package:asgard/features/cart/widget/overview.dart';
import 'package:asgard/features/notifications/widgets/notification_bar.dart';
import 'package:asgard_core/asgard_core.dart';

class ProductDetailNavigationBar extends StatelessWidget {
  const ProductDetailNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return NotificationBar(
      child: AppNavigationBar(
        leading: const AppBackButton(),
        trailing: AppButton(
          icon: theme.icons.characters.addProduct,
          title: 'Add to cart',
          onTap: () {},
        ),
        body: const CartOverview(),
      ),
    );
  }
}
