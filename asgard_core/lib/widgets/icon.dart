import 'package:asgard_core/theme/theme.dart';
import 'package:flutter/widgets.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.content, {
    Key? key,
    this.color,
    this.size = 24,
  }) : super(key: key);

  final String content;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = this.color ?? theme.colors.foreground;
    return Text(
      content,
      style: TextStyle(
        fontFamily: theme.icons.fontFamily,
        package: theme.icons.fontPackage,
        color: color,
        fontSize: size,
      ),
    );
  }
}
