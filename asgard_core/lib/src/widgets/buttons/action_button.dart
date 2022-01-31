import 'package:asgard_core/asgard_core.dart';
import 'package:asgard_core/src/widgets/base/tap.dart';

class AppActionButton extends StatelessWidget {
  const AppActionButton({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppTapBuilder(
      onTap: onTap,
      builder: (context, state) {
        switch (state) {
          case AppTapState.hovered:
            return AppActionButtonLayout.hovered(
              icon: icon,
            );
          case AppTapState.pressed:
            return AppActionButtonLayout.pressed(
              icon: icon,
            );
          default:
            return AppActionButtonLayout.inactive(
              icon: icon,
            );
        }
      },
    );
  }
}

class AppActionButtonLayout extends StatelessWidget {
  const AppActionButtonLayout.inactive({
    Key? key,
    required this.icon,
  })  : _state = AppButtonState.inactive,
        super(key: key);

  const AppActionButtonLayout.hovered({
    Key? key,
    required this.icon,
  })  : _state = AppButtonState.hovered,
        super(key: key);

  const AppActionButtonLayout.pressed({
    Key? key,
    required this.icon,
  })  : _state = AppButtonState.pressed,
        super(key: key);

  final String icon;
  final AppButtonState _state;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    switch (_state) {
      case AppButtonState.hovered:
        return AppButtonLayout.hovered(
          icon: icon,
          hoveredBackgroundColor: theme.colors.accentOpposite.withOpacity(0.15),
        );
      case AppButtonState.pressed:
        return AppButtonLayout.pressed(
          icon: icon,
          pressedBackgroundColor: theme.colors.accentOpposite.withOpacity(0.20),
        );
      case AppButtonState.inactive:
        return AppButtonLayout.inactive(
          icon: icon,
          inactiveBackgroundColor: theme.colors.accentOpposite.withOpacity(0),
        );
    }
  }
}
