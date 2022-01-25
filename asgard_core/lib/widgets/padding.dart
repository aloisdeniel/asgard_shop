import 'package:asgard_core/theme/theme.dart';
import 'package:flutter/widgets.dart';

import 'gap.dart';

class AppPadding extends StatelessWidget {
  const AppPadding({
    Key? key,
    this.left = AppGapSize.regular,
    this.top = AppGapSize.regular,
    this.right = AppGapSize.regular,
    this.bottom = AppGapSize.regular,
    this.child,
  }) : super(key: key);

  const AppPadding.small({
    Key? key,
    AppGapSize? left,
    AppGapSize? top,
    AppGapSize? right,
    AppGapSize? bottom,
    this.child,
  })  : left = left ?? AppGapSize.small,
        top = top ?? AppGapSize.small,
        right = right ?? AppGapSize.small,
        bottom = bottom ?? AppGapSize.small,
        super(key: key);

  final AppGapSize left;
  final AppGapSize right;
  final AppGapSize top;
  final AppGapSize bottom;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: left.getSpacing(theme),
        top: top.getSpacing(theme),
        right: right.getSpacing(theme),
        bottom: right.getSpacing(theme),
      ),
      child: child,
    );
  }
}
