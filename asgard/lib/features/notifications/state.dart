import 'package:asgard_core/asgard_core.dart';
import 'package:equatable/equatable.dart';

class NotificationsState extends Equatable {
  const NotificationsState({
    required this.lastNotification,
  });

  final NotificationState? lastNotification;

  factory NotificationsState.demo() => const NotificationsState(
        lastNotification: NotificationState(
          title: 'Save 50% on shields this week',
          description: 'See the offer',
          type: NotificationType.offer,
        ),
      );

  @override
  List<Object?> get props => [lastNotification];
}

class NotificationsNotifier extends ValueNotifier<NotificationsState> {
  NotificationsNotifier.demo() : super(NotificationsState.demo());

  void close() {
    value = const NotificationsState(
      lastNotification: null,
    );
  }
}

class NotificationState extends Equatable {
  const NotificationState({
    required this.type,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  final NotificationType type;

  @override
  List<Object?> get props => [
        title,
        description,
        type,
      ];
}

enum NotificationType {
  offer,
}
