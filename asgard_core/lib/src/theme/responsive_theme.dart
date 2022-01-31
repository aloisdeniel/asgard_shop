import 'dart:ui' as ui;

import 'package:asgard_core/src/theme/theme.dart';
import 'package:flutter/widgets.dart';

class AppResponsiveTheme extends StatelessWidget {
  const AppResponsiveTheme({
    Key? key,
    required this.child,
    this.theme,
  }) : super(key: key);

  final AppThemeData? theme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final useDarkTheme = platformBrightness == ui.Brightness.dark;
    final highContrast = MediaQuery.highContrastOf(context);
    var theme = this.theme ?? AppThemeData.regular();

    if (this.theme == null) {
      if (useDarkTheme) {
        theme = theme.withColors(AppColorsData.dark());
      }
      if (highContrast) {
        theme = theme.withColors(AppColorsData.highContrast());
      }
    }
    return AppTheme(
      data: theme,
      child: child,
    );
  }
}
