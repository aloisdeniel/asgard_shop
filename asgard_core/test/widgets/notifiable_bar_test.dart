import 'package:asgard_core/asgard_core.dart';
import '../base/widget.dart';

void main() {
  Widget bar(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: theme.radius.asBorderRadius().small,
        color: theme.colors.actionBarBackground,
      ),
    );
  }

  AppNotification notification(BuildContext context) {
    final theme = AppTheme.of(context);
    return AppNotification(
      title: 'Save 50% on shields this week',
      description: 'See the offer',
      icon: theme.icons.characters.tag,
    );
  }

  testAppWidgets(
    'notifiable_bar',
    {
      'opened': Builder(
        builder: (context) {
          return AppNotifiableBarLayout.opened(
            notification: notification(context),
            child: bar(context),
          );
        },
      ),
      'closed': Builder(
        builder: (context) {
          return AppNotifiableBarLayout.closed(
            child: bar(context),
          );
        },
      ),
    },
  );
}
