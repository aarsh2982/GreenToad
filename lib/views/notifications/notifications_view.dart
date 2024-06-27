// Notifications View
import 'package:flutter/material.dart';
import 'package:greentoad_app/views/notifications/widgets/single_notification_tile.dart';

// temp
import 'package:greentoad_app/models/notification_model.dart';

final List<NotificationModel> notifications = [
  NotificationModel(
    id: "querfowd3497",
    title: "Notification #one",
    message: "This is a crazy notification message from GreenToad app!",
    time: DateTime.now(),
    isRead: false,
  ),
  NotificationModel(
    id: "querfowd34sf7",
    title: "Notification #two",
    message: "This is a crazy notification message from GreenToad app again!",
    time: DateTime.now(),
    isRead: false,
  ),
  NotificationModel(
    id: "querfafdhj34sf7",
    title: "Notification #three",
    message:
        "This is a crazy notification message from GreenToad app again once again!",
    time: DateTime.now(),
    isRead: true,
  ),
  NotificationModel(
    id: "quer1348d34sf7",
    title: "Notification #four",
    message:
        "This is a crazy notification message from GreenToad app again! Ahggg",
    time: DateTime.now(),
    isRead: false,
  ),
];

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            return SingleNotificationTile(
              id: notifications[index].id,
              isRead: notifications[index].isRead,
              title: notifications[index].title,
              message: notifications[index].message,
              time: notifications[index].time,
            );
          },
        ),
      ),
    );
  }
}
