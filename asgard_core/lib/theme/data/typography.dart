import 'package:asgard_core/utils/named.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class AppTypographyData extends Equatable {
  const AppTypographyData({
    required this.paragraph1,
    required this.paragraph2,
    required this.title1,
    required this.title2,
    required this.title3,
  });

  factory AppTypographyData.regular() => const AppTypographyData(
        paragraph1: TextStyle(
          fontFamily: 'Poppins',
          package: 'asgard_core',
          fontSize: 12,
          decoration: TextDecoration.none,
        ),
        paragraph2: TextStyle(
          fontFamily: 'Poppins',
          package: 'asgard_core',
          fontSize: 10,
          decoration: TextDecoration.none,
        ),
        title1: TextStyle(
          fontFamily: 'Poppins',
          package: 'asgard_core',
          fontSize: 32,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        title2: TextStyle(
          fontFamily: 'Poppins',
          package: 'asgard_core',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
        title3: TextStyle(
          fontFamily: 'Poppins',
          package: 'asgard_core',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
        ),
      );

  final TextStyle paragraph1;
  final TextStyle paragraph2;
  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;

  @override
  List<Object?> get props => [
        Named('title1', title1),
        Named('title2', title2),
        Named('title3', title3),
        Named('paragraph1', paragraph1),
        Named('paragraph2', paragraph2),
      ];
}
