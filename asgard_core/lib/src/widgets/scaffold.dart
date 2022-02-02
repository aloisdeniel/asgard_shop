import 'dart:math' as math;

import 'package:asgard_core/asgard_core.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required this.body,
    this.backgroundColor,
    this.floatingBar,
  }) : super(key: key);

  final Widget body;
  final Color? backgroundColor;
  final Widget? floatingBar;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = AppTheme.of(context);
    final floatingBar = this.floatingBar;
    return Container(
      color: backgroundColor ?? theme.colors.background,
      child: Stack(
        children: [
          body,
          if (floatingBar != null)
            AnimatedPositioned(
              duration: theme.durations.regular,
              left: math.max(
                mediaQuery.padding.left,
                theme.spacing.regular,
              ),
              right: math.max(
                mediaQuery.padding.right,
                theme.spacing.regular,
              ),
              bottom: math.max(
                mediaQuery.padding.bottom,
                theme.spacing.regular,
              ),
              child: floatingBar,
            ),
        ],
      ),
    );
  }
}
