// Unit Test for Notification Model
// Purpose: To test serialization and deserialization of model methods.

import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';
import 'package:greentoad_app/models/notification_model.dart';

void main() {
  group(
    'NotificationModel',
    () {
      test(
        'should convert from and to map correctly!',
        () {
          // creating new Notification model
          final notification = NotificationModel(
            id: const Uuid().v4(),
            title: 'Reminder',
            message: 'CN5009 submission due today!',
            time: DateTime.now(),
          );

          // converts to map
          final map = notification.toMap();

          // converts back to notification model
          final newNotification = NotificationModel.fromMap(map);

          // comparing results
          expect(notification.id, newNotification.id);
          expect(notification.title, newNotification.title);
          expect(notification.message, newNotification.message);
          expect(notification.time, newNotification.time);
          expect(notification.isRead, newNotification.isRead);
        },
      );
    },
  );
}
