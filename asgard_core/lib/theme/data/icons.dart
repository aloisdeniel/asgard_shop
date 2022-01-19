import 'package:asgard_core/utils/named.dart';
import 'package:equatable/equatable.dart';

class AppIconData extends Equatable {
  const AppIconData({
    required this.fontFamily,
    required this.fontPackage,
    required this.characters,
  });

  /// Icons have been exported with "Export Icon Font" Figma plugin.
  factory AppIconData.regular() => AppIconData(
        fontFamily: 'asgard_icons',
        fontPackage: 'asgard_core',
        characters: AppIconCharactersData.regular(),
      );

  final String fontFamily;
  final String? fontPackage;
  final AppIconCharactersData characters;

  @override
  List<Object?> get props => [
        fontFamily,
        fontPackage,
        characters,
      ];
}

class AppIconCharactersData extends Equatable {
  const AppIconCharactersData({
    required this.addProduct,
    required this.arrowBack,
    required this.dismiss,
    required this.options,
    required this.tag,
    required this.vikoin,
  });

  factory AppIconCharactersData.regular() => AppIconCharactersData(
        addProduct: String.fromCharCodes([57344, 58343, 58413, 57568]),
        arrowBack: String.fromCharCodes([57344, 58537, 59260, 57572]),
        dismiss: String.fromCharCodes([57344, 57911, 61195, 57514]),
        options: String.fromCharCodes([58088, 58314, 57452]),
        tag: String.fromCharCodes([59112, 57969, 57576]),
        vikoin: String.fromCharCodes([57344, 57929, 57730, 57522]),
      );

  final String addProduct;
  final String arrowBack;
  final String dismiss;
  final String options;
  final String tag;
  final String vikoin;

  @override
  List<Object?> get props => [
        Named('addProduct', addProduct),
        Named('arrowBack', arrowBack),
        Named('dismiss', dismiss),
        Named('tag', tag),
        Named('vikoin', vikoin),
      ];
}
