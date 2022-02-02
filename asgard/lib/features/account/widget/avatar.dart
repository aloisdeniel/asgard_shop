import 'package:asgard/features/account/state.dart';
import 'package:asgard_core/asgard_core.dart';
import 'package:provider/provider.dart';

class CurrentUserAvatar extends StatelessWidget {
  const CurrentUserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url = context.select((AccountState state) => state.picture);
    return UserAvatar(
      url: url,
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        return ClipOval(
          child: child,
        );
      },
    );
  }
}
