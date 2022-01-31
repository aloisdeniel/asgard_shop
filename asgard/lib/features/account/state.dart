import 'package:asgard_core/asgard_core.dart';
import 'package:equatable/equatable.dart';

class AccountState extends Equatable {
  const AccountState({
    required this.name,
    required this.picture,
  });

  final String name;
  final String picture;

  factory AccountState.demo() => const AccountState(
        name: 'John',
        picture: 'https://picsum.photos/id/80/200/300',
      );

  @override
  List<Object?> get props => [
        name,
        picture,
      ];
}

class AccountNotifier extends ValueNotifier<AccountState> {
  AccountNotifier.demo() : super(AccountState.demo());
}
