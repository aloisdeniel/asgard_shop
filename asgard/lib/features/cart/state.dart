import 'package:asgard/services/services.dart';
import 'package:asgard_core/asgard_core.dart';
import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  const CartState({
    required this.items,
  });

  final List<CartItem> items;

  int get totalPrice => items.fold(
        0,
        (total, item) => total + item.quantity * item.product.price,
      );

  factory CartState.demo() => const CartState(
        items: [
          CartItem(
            quantity: 2,
            product: Product(
              id: '002',
              image: 'https://picsum.photos/id/20/200/300',
              name: 'Viktar',
              description: 'Example ...',
              category: 'Clothes',
              price: 68,
              imageAspectRatio: 0.7,
            ),
          ),
          CartItem(
            quantity: 1,
            product: Product(
              id: '003',
              image: 'https://picsum.photos/id/30/200/300',
              name: 'Jvynir',
              description: 'Example ...',
              category: 'Helmets',
              price: 240,
              imageAspectRatio: 0.8,
            ),
          ),
        ],
      );

  @override
  List<Object?> get props => [items];
}

class CartNotifier extends ValueNotifier<CartState> {
  CartNotifier.demo() : super(CartState.demo());
}

class CartItem extends Equatable {
  const CartItem({
    required this.product,
    required this.quantity,
  });
  final Product product;
  final int quantity;

  @override
  List<Object?> get props => [product, quantity];
}
