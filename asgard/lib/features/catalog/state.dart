import 'package:asgard/services/services.dart';
import 'package:asgard_core/asgard_core.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';

class CatalogState extends Equatable {
  const CatalogState({
    required this.products,
  });

  final List<Product> products;

  factory CatalogState.demo() => const CatalogState(
        products: [
          Product(
            id: '001',
            image: 'https://picsum.photos/id/10/200/300',
            name: 'Kygnor',
            description: 'Example ...',
            category: 'Axes',
            price: 100,
            imageAspectRatio: 0.9,
          ),
          Product(
            id: '002',
            image: 'https://picsum.photos/id/20/200/300',
            name: 'Viktar',
            description: 'Example ...',
            category: 'Clothes',
            price: 68,
            imageAspectRatio: 0.7,
          ),
          Product(
            id: '003',
            image: 'https://picsum.photos/id/30/200/300',
            name: 'Jvynir',
            description: 'Example ...',
            category: 'Helmets',
            price: 240,
            imageAspectRatio: 0.8,
          ),
          Product(
            id: '004',
            image: 'https://picsum.photos/id/40/200/300',
            name: 'Mulnir',
            description: 'Example ...',
            category: 'Animals',
            price: 32,
            imageAspectRatio: 0.6,
          ),
          Product(
            id: '005',
            image: 'https://picsum.photos/id/50/200/300',
            name: 'Magnar',
            description: 'Example ...',
            category: 'Helmets',
            price: 120,
            imageAspectRatio: 0.5,
          ),
          Product(
            id: '006',
            image: 'https://picsum.photos/id/60/200/300',
            name: 'Oknaar',
            description: 'Example ...',
            category: 'Axes',
            price: 172,
            imageAspectRatio: 0.76,
          ),
          Product(
            id: '007',
            image: 'https://picsum.photos/id/70/200/300',
            name: 'Oknaar',
            description: 'Example ...',
            category: 'Helmets',
            price: 208,
            imageAspectRatio: 0.92,
          ),
        ],
      );

  Product? getProduct(String id) => products.firstWhereOrNull(
        (product) => product.id == id,
      );

  @override
  List<Object?> get props => throw UnimplementedError();
}

class CatalogNotifier extends ValueNotifier<CatalogState> {
  CatalogNotifier.demo() : super(CatalogState.demo());
}
