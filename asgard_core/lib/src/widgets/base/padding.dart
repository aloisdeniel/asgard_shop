import 'package:asgard_core/src/theme/theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import 'gap.dart';

class AppEdgeInsets extends Equatable {
  const AppEdgeInsets.all(AppGapSize value)
      : left = value,
        top = value,
        right = value,
        bottom = value;

  const AppEdgeInsets.symmetric({
    AppGapSize vertical = AppGapSize.none,
    AppGapSize horizontal = AppGapSize.none,
  })  : left = horizontal,
        top = vertical,
        right = horizontal,
        bottom = vertical;

  const AppEdgeInsets.only({
    this.left = AppGapSize.none,
    this.top = AppGapSize.none,
    this.right = AppGapSize.none,
    this.bottom = AppGapSize.none,
  });

  const AppEdgeInsets.small()
      : left = AppGapSize.small,
        top = AppGapSize.small,
        right = AppGapSize.small,
        bottom = AppGapSize.small;

  const AppEdgeInsets.semiSmall()
      : left = AppGapSize.semiSmall,
        top = AppGapSize.semiSmall,
        right = AppGapSize.semiSmall,
        bottom = AppGapSize.semiSmall;

  const AppEdgeInsets.regular()
      : left = AppGapSize.regular,
        top = AppGapSize.regular,
        right = AppGapSize.regular,
        bottom = AppGapSize.regular;

  const AppEdgeInsets.semiBig()
      : left = AppGapSize.semiBig,
        top = AppGapSize.semiBig,
        right = AppGapSize.semiBig,
        bottom = AppGapSize.semiBig;

  const AppEdgeInsets.big()
      : left = AppGapSize.big,
        top = AppGapSize.big,
        right = AppGapSize.big,
        bottom = AppGapSize.big;

  final AppGapSize left;
  final AppGapSize top;
  final AppGapSize right;
  final AppGapSize bottom;

  @override
  List<Object?> get props => [
        left,
        top,
        right,
        bottom,
      ];

  EdgeInsets toEdgeInsets(AppThemeData theme) {
    return EdgeInsets.only(
      left: left.getSpacing(theme),
      top: top.getSpacing(theme),
      right: right.getSpacing(theme),
      bottom: bottom.getSpacing(theme),
    );
  }
}

class AppPadding extends StatelessWidget {
  const AppPadding({
    Key? key,
    this.padding = const AppEdgeInsets.all(AppGapSize.none),
    this.child,
  }) : super(key: key);

  const AppPadding.small({
    Key? key,
    this.child,
  })  : padding = const AppEdgeInsets.all(AppGapSize.none),
        super(key: key);

  const AppPadding.semiSmall({
    Key? key,
    this.child,
  })  : padding = const AppEdgeInsets.all(AppGapSize.semiSmall),
        super(key: key);

  const AppPadding.regular({
    Key? key,
    this.child,
  })  : padding = const AppEdgeInsets.all(AppGapSize.regular),
        super(key: key);

  const AppPadding.semiBig({
    Key? key,
    this.child,
  })  : padding = const AppEdgeInsets.all(AppGapSize.semiBig),
        super(key: key);

  const AppPadding.big({
    Key? key,
    this.child,
  })  : padding = const AppEdgeInsets.all(AppGapSize.big),
        super(key: key);

  final AppEdgeInsets padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: padding.toEdgeInsets(theme),
      child: child,
    );
  }
}
