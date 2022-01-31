import 'dart:ui' as ui;

import 'package:asgard_core/src/theme/data/form_factor.dart';
import 'package:asgard_core/src/theme/data/typography.dart';
import 'package:asgard_core/src/theme/theme.dart';
import 'package:flutter/widgets.dart';

/// Updates automatically the [AppTheme] regarding the current [MediaQuery],
/// as soon as the [theme] isn't overriden.
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
    var theme = this.theme ?? AppThemeData.regular();

    if (this.theme == null) {
      /// Updating the colors for the current brightness
      final platformBrightness = MediaQuery.platformBrightnessOf(context);
      final useDarkTheme = platformBrightness == ui.Brightness.dark;
      final highContrast = MediaQuery.highContrastOf(context);
      if (useDarkTheme) {
        theme = theme.withColors(AppColorsData.dark());
      }
      if (highContrast) {
        theme = theme.withColors(AppColorsData.highContrast());
      }

      // Updating the sizes for current form factor.
      final mediaQuery = MediaQuery.of(context);
      var formFactor = () {
        if (mediaQuery.size.width < 200) {
          return AppFormFactor.small;
        }

        return AppFormFactor.medium;
      }();
      theme = theme.withFormFactor(formFactor);

      if (formFactor == AppFormFactor.small) {
        theme = theme.withTypography(AppTypographyData.small());
      }
    }
    return AppTheme(
      data: theme,
      child: child,
    );
  }
}
