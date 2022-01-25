import 'package:asgard_core/theme/theme.dart';
import 'package:flutter/widgets.dart';

enum AppIconData {
  addProduct,
  arrowBack,
  dismiss,
  options,
  tag,
  vikoin,
}

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

class AppAnimatedIcon extends StatelessWidget {
  const AppAnimatedIcon(
    this.content, {
    Key? key,
    this.color,
    this.size = 24,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  final String content;
  final Color? color;
  final double size;
  final Duration duration;

  bool get isAnimated => duration.inMilliseconds > 0;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final color = this.color ?? theme.colors.foreground;
    if (!isAnimated) {
      return AppIcon(
        content,
        key: key,
        color: color,
        size: size,
      );
    }
    return AnimatedDefaultTextStyle(
      child: Text(
        content,
      ),
      style: TextStyle(
        fontFamily: theme.icons.fontFamily,
        package: theme.icons.fontPackage,
        color: color,
        fontSize: size,
      ),
      duration: duration,
    );
  }
}
