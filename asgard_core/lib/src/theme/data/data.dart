import 'package:asgard_core/src/theme/data/spacing.dart';
import 'package:asgard_core/src/theme/data/typography.dart';
import 'package:equatable/equatable.dart';

import 'colors.dart';
import 'icons.dart';
import 'radius.dart';
import 'shadows.dart';

class AppThemeData extends Equatable {
  const AppThemeData({
    required this.icons,
    required this.colors,
    required this.typography,
    required this.radius,
    required this.spacing,
    required this.shadow,
  });

  factory AppThemeData.regular() => AppThemeData(
        icons: AppIconsData.regular(),
        typography: AppTypographyData.regular(),
        colors: AppColorsData.light(),
        radius: const AppRadiusData.regular(),
        spacing: AppSpacingData.regular(),
        shadow: AppShadowsData.regular(),
      );

  final AppIconsData icons;
  final AppColorsData colors;
  final AppTypographyData typography;
  final AppRadiusData radius;
  final AppSpacingData spacing;
  final AppShadowsData shadow;

  @override
  List<Object?> get props => [
        icons,
        colors,
        typography,
        radius,
        spacing,
        shadow,
      ];
}
