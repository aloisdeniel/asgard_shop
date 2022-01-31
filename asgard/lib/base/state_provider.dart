import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class StateProvider<State, Notifier extends ValueNotifier<State>>
    extends StatelessWidget {
  const StateProvider({
    Key? key,
    required this.create,
    required this.child,
  }) : super(key: key);

  final Create<Notifier> create;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<Notifier>(
      create: create,
      builder: (context, _) {
        return ValueListenableProvider<State>.value(
          value: context.watch<Notifier>(),
          child: child,
        );
      },
    );
  }
}
