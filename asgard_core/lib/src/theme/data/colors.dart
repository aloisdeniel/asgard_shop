import 'package:asgard_core/src/utils/named.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class AppColorsData extends Equatable {
  const AppColorsData({
    required this.accent,
    required this.accentHighlight,
    required this.accentHighlight2,
    required this.foreground,
    required this.background,
    required this.actionBarBackground,
    required this.actionBarForeground,
    required this.accentOpposite,
  });

  factory AppColorsData.light() => const AppColorsData(
        accent: Color(0xFF454CFF),
        accentOpposite: Color(0xFFFFFFFF),
        accentHighlight: Color(0xFF2D33B9),
        accentHighlight2: Color(0xFF272C9A),
        foreground: Color(0xFF000000),
        background: Color(0xFFFFFFFF),
        actionBarBackground: Color(0xFF000000),
        actionBarForeground: Color(0xFFFFFFFF),
      );

  factory AppColorsData.dark() => const AppColorsData(
        accent: Color(0xFF454CFF),
        accentOpposite: Color(0xFFFFFFFF),
        accentHighlight: Color(0xFF2D33B9),
        accentHighlight2: Color(0xFF272C9A),
        foreground: Color(0xFFFFFFFF),
        background: Color(0xFF111111),
        actionBarBackground: Color(0xFF000000),
        actionBarForeground: Color(0xFFFFFFFF),
      );

  factory AppColorsData.highContrast() => const AppColorsData(
        accent: Color(0xFF000000),
        accentOpposite: Color(0xFFFFFFFF),
        accentHighlight: Color(0xFF000000),
        accentHighlight2: Color(0xFF000000),
        foreground: Color(0xFF222222),
        background: Color(0xFFFFFFFF),
        actionBarBackground: Color(0xFFDDDDDD),
        actionBarForeground: Color(0xFF222222),
      );

  final Color accent;
  final Color accentHighlight;
  final Color accentHighlight2;
  final Color foreground;
  final Color accentOpposite;
  final Color background;
  final Color actionBarForeground;
  final Color actionBarBackground;

  @override
  List<Object?> get props => [
        accent.named('accent'),
        accentHighlight.named('accentHighlight'),
        accentHighlight2.named('accentHighlight2'),
        foreground.named('foreground'),
        accentOpposite.named('accentOpposite'),
        background.named('background'),
        actionBarForeground.named('actionBarForeground'),
        actionBarBackground.named('actionBarBackground'),
      ];
}
