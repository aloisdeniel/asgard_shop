import 'package:asgard/features/account/widget/avatar.dart';
import 'package:asgard/features/cart/widget/overview.dart';
import 'package:asgard/features/catalog/widgets/navigation_bar.dart';
import 'package:asgard/features/notifications/widgets/notification_bar.dart';
import 'package:asgard_core/asgard_core.dart';

class ProductDetailNavigationBar extends StatelessWidget {
  const ProductDetailNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final route = ModalRoute.of(context);
    return NotificationBar(
      child: AppNavigationBar(
        animation: route?.animation,
        canNavigateBack: true,
        leading: const CurrentUserAvatar(),
        body: const CurrentUserAccount(),
        summary: const CartOverview(),
        action: AppButton(
          icon: theme.icons.characters.addProduct,
          title: 'Add to cart',
          onTap: () {},
        ),
      ),
    );
  }
}
