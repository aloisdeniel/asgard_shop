import 'package:asgard_core/utils/named.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

class AppRadiusData extends Equatable {
  const AppRadiusData({
    required this.small,
    required this.regular,
    required this.big,
  });

  factory AppRadiusData.regular() => const AppRadiusData(
        small: Radius.circular(10),
        regular: Radius.circular(12),
        big: Radius.circular(16),
      );

  final Radius small;
  final Radius regular;
  final Radius big;

  @override
  List<Object?> get props => [
        small.named('small'),
        regular.named('regular'),
        big.named('big'),
      ];
}
