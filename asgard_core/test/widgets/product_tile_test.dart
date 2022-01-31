import 'package:asgard_core/asgard_core.dart';
import '../base/image_mock.dart';
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
        image: dogImage,
      ),
      'hovered': const ProductTileLayout.hovered(
        name: name,
        price: price,
        image: dogImage,
      ),
    },
  );
}
