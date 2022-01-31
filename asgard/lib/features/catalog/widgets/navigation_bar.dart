import 'package:asgard/features/account/widget/avatar.dart';
import 'package:asgard/features/cart/widget/overview.dart';
import 'package:asgard_core/asgard_core.dart';

class CatalogNavigationBar extends StatelessWidget {
  const CatalogNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppNotifiableBar(
      notification: AppNotification(
        title: 'Save 50% on shields this week',
        description: 'See the offer',
        icon: theme.icons.characters.tag,
      ),
      child: AppNavigationBar(
        leading: const CurrentUserAvatar(),
        trailing: const CartOverview(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText.paragraph1(
              'Account',
              color: theme.colors.actionBarForeground,
            ),
            AppText.title3(
              'John',
              color: theme.colors.actionBarForeground,
            ),
          ],
        ),
      ),
    );
  }
}
