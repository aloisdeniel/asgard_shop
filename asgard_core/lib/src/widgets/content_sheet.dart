import 'package:asgard_core/src/theme/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:sliver_tools/sliver_tools.dart';

class AppContentSheet extends StatelessWidget {
  const AppContentSheet({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final route = ModalRoute.of(context);
    return SlideTransition(
      position: Tween(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: route!.animation!,
          curve: Curves.easeOutQuad,
        ),
      ),
      child: CustomScrollView(
        reverse: true,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(
              top: mediaQuery.padding.top + theme.spacing.regular,
            ),
            sliver: SliverStack(
              children: <Widget>[
                SliverPositioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colors.background,
                      borderRadius: theme.radius.asBorderRadius().big,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    left: theme.spacing.semiBig,
                    right: theme.spacing.semiBig,
                    top: theme.spacing.semiBig,
                    bottom: mediaQuery.padding.bottom + theme.spacing.semiBig,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        ...children.reversed,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
