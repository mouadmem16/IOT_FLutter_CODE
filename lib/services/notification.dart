import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class Notification {

  FlutterLocalNotificationsPlugin notification =
  FlutterLocalNotificationsPlugin();

  showOnGoingNotification(
      FlutterLocalNotificationsPlugin notification, String title, String body,
      {int id = 0}) {
    final AndroidChanneltype = AndroidNotificationDetails(
        "channel ID", "Channel Name", "Channel Description",
        importance: Importance.Max, priority: Priority.High, autoCancel: false);

    final IOSChanneltype = IOSNotificationDetails();

    return notification.show(id, title, body,
        NotificationDetails(AndroidChanneltype, IOSChanneltype));
  }


}

Notification notification = Notification();