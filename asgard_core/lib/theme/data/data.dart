import 'package:asgard_core/theme/data/spacing.dart';
import 'package:asgard_core/theme/data/typography.dart';
import 'package:equatable/equatable.dart';

import 'colors.dart';
import 'icons.dart';
import 'radius.dart';

class AppThemeData extends Equatable {
  const AppThemeData({
    required this.icons,
    required this.colors,
    required this.typography,
    required this.radius,
    required this.spacing,
  });

  factory AppThemeData.regular() => AppThemeData(
        icons: AppIconsData.regular(),
        typography: AppTypographyData.regular(),
        colors: AppColorsData.light(),
        radius: AppRadiusData.regular(),
        spacing: AppSpacingData.regular(),
      );

  final AppIconsData icons;
  final AppColorsData colors;
  final AppTypographyData typography;
  final AppRadiusData radius;
  final AppSpacingData spacing;

  @override
  List<Object?> get props => [
        icons,
        colors,
        typography,
        radius,
        spacing,
      ];
}
