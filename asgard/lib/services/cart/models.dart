import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  const Cart({
    required this.productIds,
  });

  final List<String> productIds;

  @override
  List<Object?> get props => [productIds];
}
