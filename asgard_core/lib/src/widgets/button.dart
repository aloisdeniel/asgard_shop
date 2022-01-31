import 'package:asgard_core/asgard_core.dart';
import 'package:asgard_core/src/widgets/base/tap.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.icon,
    this.title,
    this.onTap,
    this.mainAxisSize = MainAxisSize.min,
  })  : assert(
          icon != null || title != null,
        ),
        super(key: key);

  final String? icon;
  final String? title;
  final MainAxisSize mainAxisSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppTapBuilder(
      onTap: onTap,
      builder: (context, state) {
        switch (state) {
          case AppTapState.hovered:
            return Semantics(
              enabled: true,
              selected: true,
              child: AppButtonLayout.hovered(
                icon: icon,
                title: title,
                mainAxisSize: mainAxisSize,
              ),
            );
          case AppTapState.pressed:
            return Semantics(
              enabled: true,
              selected: true,
              child: AppButtonLayout.pressed(
                icon: icon,
                title: title,
                mainAxisSize: mainAxisSize,
              ),
            );
          default:
            return Semantics(
              enabled: true,
              selected: true,
              child: AppButtonLayout.inactive(
                icon: icon,
                title: title,
                mainAxisSize: mainAxisSize,
              ),
            );
        }
      },
    );
  }
}

enum AppButtonState {
  inactive,
  hovered,
  pressed,
}

class AppButtonLayout extends StatelessWidget {
  const AppButtonLayout.inactive({
    Key? key,
    this.icon,
    this.title,
    this.mainAxisSize = MainAxisSize.min,
    this.inactiveBackgroundColor,
    this.hoveredBackgroundColor,
    this.pressedBackgroundColor,
    this.foregroundColor,
  })  : _state = AppButtonState.inactive,
        assert(
          icon != null || title != null,
        ),
        super(key: key);

  const AppButtonLayout.hovered({
    Key? key,
    this.icon,
    this.title,
    this.mainAxisSize = MainAxisSize.min,
    this.inactiveBackgroundColor,
    this.hoveredBackgroundColor,
    this.pressedBackgroundColor,
    this.foregroundColor,
  })  : _state = AppButtonState.hovered,
        assert(
          icon != null || title != null,
        ),
        super(key: key);

  const AppButtonLayout.pressed({
    Key? key,
    this.icon,
    this.title,
    this.mainAxisSize = MainAxisSize.min,
    this.inactiveBackgroundColor,
    this.hoveredBackgroundColor,
    this.pressedBackgroundColor,
    this.foregroundColor,
  })  : _state = AppButtonState.pressed,
        assert(
          icon != null || title != null,
        ),
        super(key: key);

  final String? icon;
  final String? title;
  final MainAxisSize mainAxisSize;
  final AppButtonState _state;
  final Color? inactiveBackgroundColor;
  final Color? hoveredBackgroundColor;
  final Color? pressedBackgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final title = this.title;
    final icon = this.icon;
    final hasBoth = (title != null && icon != null);
    final foregroundColor = this.foregroundColor ?? theme.colors.accentOpposite;
    final backgroundColor = () {
      switch (_state) {
        case AppButtonState.inactive:
          return inactiveBackgroundColor ?? theme.colors.accent;
        case AppButtonState.hovered:
          return hoveredBackgroundColor ?? theme.colors.accentHighlight;
        case AppButtonState.pressed:
          return pressedBackgroundColor ?? theme.colors.accentHighlight2;
      }
    }();
    return AnimatedContainer(
      duration: theme.durations.quick,
      decoration: BoxDecoration(
        borderRadius: theme.radius.asBorderRadius().small,
        color: backgroundColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: theme.spacing.semiSmall,
        horizontal:
            title != null ? theme.spacing.semiBig : theme.spacing.semiSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            AppText.title3(
              title,
              color: foregroundColor,
            ),
          if (hasBoth) const AppGap.semiSmall(),
          if (icon != null) AppIcon.regular(icon, color: foregroundColor),
        ],
      ),
    );
  }
}
