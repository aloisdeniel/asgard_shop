import 'package:asgard/features/cart/state.dart';
import 'package:asgard_core/asgard_core.dart';
import 'package:provider/provider.dart';

class CartOverview extends StatelessWidget {
  const CartOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final itemCount = context.select((CartState state) => state.items.length);
    final totalPrice = context.select((CartState state) => state.totalPrice);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText.paragraph1(
              '$itemCount items',
              color: theme.colors.actionBarForeground,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText.title3(
                  '$totalPrice',
                  color: theme.colors.actionBarForeground,
                ),
                AppIcon.regular(
                  theme.icons.characters.vikoin,
                  color: theme.colors.actionBarForeground,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
