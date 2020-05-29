import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:iot_heartbeats/screens/home_page.dart';
import 'package:iot_heartbeats/services/notification.dart';

class LocalNotification extends StatefulWidget {
  @override
  _LocalNotificationState createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {

  @override
  void initState() {
    var initSettAndroid = AndroidInitializationSettings('heart');
    var initSettIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));
    var initializationSettings =
        InitializationSettings(initSettAndroid, initSettIOS);
    notification.notification.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future onSelectNotification(String payload) async => await Navigator.push(
      context, MaterialPageRoute(builder: (context) => HomePage()));

}
