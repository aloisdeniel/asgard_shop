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
  });

  factory AppThemeData.regular() => AppThemeData(
        icons: AppIconData.regular(),
        typography: AppTypographyData.regular(),
        colors: AppColorData.light(),
        radius: AppRadiusData.regular(),
      );

  final AppIconData icons;
  final AppColorData colors;
  final AppTypographyData typography;
  final AppRadiusData radius;

  @override
  List<Object?> get props => [
        icons,
        colors,
        typography,
        radius,
      ];
}
