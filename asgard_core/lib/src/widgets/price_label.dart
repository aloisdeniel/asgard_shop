import 'package:asgard_core/src/theme/theme.dart';
import 'package:flutter/widgets.dart';

import 'base/base.dart';

class PriceLabel extends StatelessWidget {
  const PriceLabel(
    this.value, {
    Key? key,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppContainer(
      decoration: BoxDecoration(
        color: theme.colors.accent,
        borderRadius: theme.radius.asBorderRadius().regular,
      ),
      padding: const AppEdgeInsets.symmetric(
        vertical: AppGapSize.semiSmall,
        horizontal: AppGapSize.regular,
      ),
      child: Row(
        children: [
          AppText.title3(
            value.toString(),
            color: theme.colors.accentOpposite,
          ),
          const AppGap.small(),
          AppIcon.regular(
            theme.icons.characters.vikoin,
            color: theme.colors.accentOpposite,
          ),
        ],
      ),
    );
  }
}
