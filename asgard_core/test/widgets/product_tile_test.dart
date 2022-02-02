import 'package:asgard_core/asgard_core.dart';
import 'package:test_utils/test_utils.dart';
import '../base/widget.dart';

void main() async {
  const name = 'Dog';
  const price = 300.0;

  testAppWidgets(
    'product_tile_test',
    {
      'idle': const ProductTileLayout.idle(
        name: name,
        price: price,
        image: kDogImage,
      ),
      'hovered': const ProductTileLayout.hovered(
        name: name,
        price: price,
        image: kDogImage,
      ),
    },
  );
}
