import 'package:asgard_core/src/utils/named.dart';
import 'package:equatable/equatable.dart';

class AppDurationsData extends Equatable {
  const AppDurationsData({
    required this.areAnimationEnabled,
    required this.regular,
    required this.quick,
  });

  factory AppDurationsData.regular() => const AppDurationsData(
        areAnimationEnabled: true,
        regular: Duration(milliseconds: 250),
        quick: Duration(milliseconds: 100),
      );

  final bool areAnimationEnabled;
  final Duration regular;
  final Duration quick;

  @override
  List<Object?> get props => [
        areAnimationEnabled,
        regular.named('regular'),
        quick.named('quick'),
      ];
}
