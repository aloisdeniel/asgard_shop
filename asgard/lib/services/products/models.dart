import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.imageAspectRatio,
  });

  final String id;
  final String image;
  final String name;
  final String category;
  final String description;
  final int price;
  final double imageAspectRatio;

  @override
  List<Object?> get props => [id];
}
