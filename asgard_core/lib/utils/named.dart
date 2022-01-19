import 'package:equatable/equatable.dart';

class Named<T> extends Equatable {
  const Named(this.name, this.value);

  final String name;
  final T value;

  @override
  List<Object?> get props => [value];
}
