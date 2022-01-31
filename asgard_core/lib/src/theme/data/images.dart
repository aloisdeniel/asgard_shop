import 'package:asgard_core/src/utils/named.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class AppImagesData extends Equatable {
  const AppImagesData({
    required this.backgroundPattern,
  });

  factory AppImagesData.regular() => const AppImagesData(
        backgroundPattern: AssetImage(
          'assets/images/background_pattern.png',
          package: 'asgard_core',
        ),
      );

  final ImageProvider backgroundPattern;

  @override
  List<Object?> get props => [
        backgroundPattern.named('backgroundPattern'),
      ];
}
