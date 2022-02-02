import 'dart:ui';

import 'package:asgard_core/asgard_core.dart';

class TransparentPage<T> extends Page<T> {
  const TransparentPage({
    required this.child,
    LocalKey? key,
    String? name,
    Object? arguments,
    String? restorationId,
  }) : super(
            key: key,
            name: name,
            arguments: arguments,
            restorationId: restorationId);

  /// The content to be shown in the [Route] created by this page.
  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) {
    final theme = AppTheme.of(context);
    return PageRouteBuilder(
      transitionDuration: theme.durations.regular,
      opaque: false,
      maintainState: true,
      settings: this,
      barrierColor: theme.colors.foreground.withOpacity(0.5),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AnimatedBuilder(
          animation: animation,
          child: child,
          builder: (context, child) => BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20 * animation.value,
              sigmaY: 20 * animation.value,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
