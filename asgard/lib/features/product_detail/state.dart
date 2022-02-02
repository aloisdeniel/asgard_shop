import 'package:asgard/services/services.dart';
import 'package:asgard_core/asgard_core.dart';
import 'package:equatable/equatable.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    required this.product,
  });

  final Product? product;

  @override
  List<Object?> get props => [product];
}

class ProductDetailNotifier extends ValueNotifier<ProductDetailState> {
  ProductDetailNotifier(ProductDetailState initialState) : super(initialState);
}
