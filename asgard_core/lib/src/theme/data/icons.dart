import 'package:asgard_core/src/utils/named.dart';
import 'package:equatable/equatable.dart';

class AppIconsData extends Equatable {
  const AppIconsData({
    required this.fontFamily,
    required this.fontPackage,
    required this.characters,
    required this.sizes,
  });

  /// Icons have been exported with "Export Icon Font" Figma plugin.
  factory AppIconsData.regular() => AppIconsData(
        fontFamily: 'asgard_icons',
        fontPackage: 'asgard_core',
        characters: AppIconCharactersData.regular(),
        sizes: AppIconSizesData.regular(),
      );

  final String fontFamily;
  final String? fontPackage;
  final AppIconCharactersData characters;
  final AppIconSizesData sizes;

  @override
  List<Object?> get props => [
        fontFamily,
        fontPackage,
        characters,
        sizes,
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
    required this.shoppingCart,
  });

  factory AppIconCharactersData.regular() => AppIconCharactersData(
        addProduct: String.fromCharCodes([57344, 58343, 58413, 57568]),
        arrowBack: String.fromCharCodes([57344, 58537, 59260, 57572]),
        dismiss: String.fromCharCodes([57344, 57911, 61195, 57514]),
        options: String.fromCharCodes([58088, 58314, 57452]),
        tag: String.fromCharCodes([59112, 57969, 57576]),
        vikoin: String.fromCharCodes([57344, 57929, 57730, 57522]),
        shoppingCart: String.fromCharCodes([57344, 58580, 57759, 57350]),
      );

  final String addProduct;
  final String arrowBack;
  final String dismiss;
  final String options;
  final String tag;
  final String vikoin;
  final String shoppingCart;

  @override
  List<Object?> get props => [
        addProduct.named('addProduct'),
        arrowBack.named('arrowBack'),
        dismiss.named('dismiss'),
        tag.named('tag'),
        vikoin.named('vikoin'),
        shoppingCart.named('shoppingCart'),
      ];
}

class AppIconSizesData extends Equatable {
  const AppIconSizesData({
    required this.small,
    required this.regular,
    required this.big,
  });

  factory AppIconSizesData.regular() => const AppIconSizesData(
        small: 16.0,
        regular: 22.0,
        big: 32.0,
      );

  final double small;
  final double regular;
  final double big;

  @override
  List<Object?> get props => [
        small.named('small'),
        regular.named('regular'),
        big.named('big'),
      ];
}
