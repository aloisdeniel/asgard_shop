import 'package:asgard_core/asgard_core.dart';
import '../base/widget.dart';

void main() {
  testAppWidgets(
    'button',
    {
      'text-inactive': const AppButtonLayout.inactive(
        title: 'Buy',
      ),
      'text-hovered': const AppButtonLayout.hovered(
        title: 'Buy',
      ),
      'text-pressed': const AppButtonLayout.pressed(
        title: 'Buy',
      ),
      'icon-inactive': Builder(
        builder: (context) {
          final theme = AppTheme.of(context);
          return AppButtonLayout.inactive(
            icon: theme.icons.characters.shoppingCart,
          );
        },
      ),
      'icon-hovered': Builder(
        builder: (context) {
          final theme = AppTheme.of(context);
          return AppButtonLayout.hovered(
            icon: theme.icons.characters.shoppingCart,
          );
        },
      ),
      'icon-pressed': Builder(
        builder: (context) {
          final theme = AppTheme.of(context);
          return AppButtonLayout.pressed(
            icon: theme.icons.characters.shoppingCart,
          );
        },
      ),
      'both-inactive': Builder(
        builder: (context) {
          final theme = AppTheme.of(context);
          return AppButtonLayout.inactive(
            title: 'Buy',
            icon: theme.icons.characters.shoppingCart,
          );
        },
      ),
      'both-hovered': Builder(
        builder: (context) {
          final theme = AppTheme.of(context);
          return AppButtonLayout.hovered(
            title: 'Buy',
            icon: theme.icons.characters.shoppingCart,
          );
        },
      ),
      'both-pressed': Builder(
        builder: (context) {
          final theme = AppTheme.of(context);
          return AppButtonLayout.pressed(
            title: 'Buy',
            icon: theme.icons.characters.shoppingCart,
          );
        },
      ),
    },
  );
}
