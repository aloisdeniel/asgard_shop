import 'package:equatable/equatable.dart';

/// This class associated a [name] to a given [value].
class Named<T> extends Equatable {
  const Named(this.name, this.value);

  final String name;
  final T value;

  @override
  List<Object?> get props => [value];

  @override
  String toString() => '<$name>($value)';
}

extension NamedExtension<T> on T {
  Named<T> named(String name) => Named<T>(name, this);
}
