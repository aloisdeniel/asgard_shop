import 'dart:math' as math;

import 'package:asgard_core/asgard_core.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    required this.body,
    this.floatingBar,
  }) : super(key: key);

  final Widget body;
  final Widget? floatingBar;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = AppTheme.of(context);
    final floatingBar = this.floatingBar;
    return Container(
      color: theme.colors.background,
      child: Stack(
        children: [
          body,
          if (floatingBar != null)
            AnimatedPositioned(
              duration: theme.durations.regular,
              left: theme.spacing.semiBig,
              right: theme.spacing.semiBig,
              bottom: math.max(
                mediaQuery.padding.bottom,
                theme.spacing.semiBig,
              ),
              child: Hero(
                tag: 'navigation_bar',
                child: floatingBar,
              ),
            ),
        ],
      ),
    );
  }
}
