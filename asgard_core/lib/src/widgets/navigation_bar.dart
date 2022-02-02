import 'package:asgard_core/asgard_core.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    Key? key,
    required this.leading,
    required this.body,
    required this.summary,
    this.canNavigateBack = false,
    this.animation,
    this.action,
  }) : super(key: key);

  final Animation<double>? animation;
  final bool canNavigateBack;
  final Widget leading;
  final Widget body;
  final Widget summary;
  final Widget? action;

  Widget _animatedBody(BuildContext context, Animation<double> animation) {
    final leading = this.leading;
    final summary = this.summary;
    final action = this.action;
    return Row(
      children: [
        if (!canNavigateBack) leading,
        if (canNavigateBack)
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: FadeTransition(
                  opacity: ReverseAnimation(animation),
                  child: leading,
                ),
              ),
              FadeTransition(
                opacity: animation,
                child: const AppBackButton(),
              ),
            ],
          ),
        const AppGap.regular(),
        if (action == null) body,
        if (action != null)
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                FadeTransition(
                  opacity: ReverseAnimation(animation),
                  child: body,
                ),
                SlideTransition(
                  position: Tween(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(
                    opacity: animation,
                    child: summary,
                  ),
                ),
              ],
            ),
          ),
        const AppGap.regular(),
        if (action == null) summary,
        if (action != null)
          Stack(
            alignment: Alignment.centerRight,
            children: [
              SlideTransition(
                position: Tween(
                  begin: const Offset(0, 0),
                  end: const Offset(-1, 0),
                ).animate(animation),
                child: FadeTransition(
                  opacity: ReverseAnimation(animation),
                  child: summary,
                ),
              ),
              FadeTransition(
                opacity: animation,
                child: action,
              ),
            ],
          ),
      ],
    );
  }

  Widget _staticBody(BuildContext context) {
    final leading = this.leading;
    final summary = this.summary;
    final action = this.action;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: leading,
            ),
            Opacity(
              opacity: !canNavigateBack ? 0.0 : 1.0,
              child: IgnorePointer(
                ignoring: !canNavigateBack,
                child: const AppBackButton(),
              ),
            ),
          ],
        ),
        const AppGap.regular(),
        if (canNavigateBack) Expanded(child: summary),
        if (!canNavigateBack)
          Expanded(
            child: body,
          ),
        const AppGap.regular(),
        if (!canNavigateBack) summary,
        if (canNavigateBack && action != null) action,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final animation = this.animation;
    return NavigationBarContainer(
      child: animation != null
          ? _animatedBody(context, animation)
          : _staticBody(context),
    );
  }
}

class NavigationBarContainer extends StatelessWidget {
  const NavigationBarContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppContainer(
      padding: const AppEdgeInsets.regular(),
      decoration: BoxDecoration(
        color: theme.colors.actionBarBackground,
        borderRadius: theme.radius.asBorderRadius().regular,
      ),
      child: child,
    );
  }
}
