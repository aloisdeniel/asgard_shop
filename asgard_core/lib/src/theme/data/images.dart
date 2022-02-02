import 'dart:typed_data';

import 'package:asgard_core/src/utils/named.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImagesData extends Equatable {
  const AppImagesData({
    required this.appLogo,
    required this.backgroundPattern,
  });

  factory AppImagesData.regular({required PictureProvider appLogo}) =>
      AppImagesData(
        appLogo: appLogo,
        backgroundPattern: const AssetImage(
          'assets/images/background_pattern.png',
          package: 'asgard_core',
        ),
      );

  factory AppImagesData.highContrast({required PictureProvider appLogo}) =>
      AppImagesData(
        appLogo: appLogo,
        backgroundPattern: MemoryImage(kTransparentImage),
      );

  final PictureProvider appLogo;
  final ImageProvider backgroundPattern;

  @override
  List<Object?> get props => [
        backgroundPattern.named('appLogo'),
        backgroundPattern.named('backgroundPattern'),
      ];

  AppImagesData withAppLogo(PictureProvider appLogo) {
    return AppImagesData(
      appLogo: appLogo,
      backgroundPattern: backgroundPattern,
    );
  }

  AppImagesData withBackgroundPattern(ImageProvider backgroundPattern) {
    return AppImagesData(
      appLogo: appLogo,
      backgroundPattern: backgroundPattern,
    );
  }
}

final kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);
