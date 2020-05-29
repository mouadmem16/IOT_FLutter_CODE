import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:iot_heartbeats/services/notification.dart';

class UserService {
  final DBRef = FirebaseDatabase.instance.reference();
  Set<String> IDs = Set();

  Stream listUsers(StreamController controller) async* {
    controller.stream.forEach((data) async* {
      yield DBRef.child("heartbeat-c4532").child(data).once().asStream();
    });
  }

  dynamic name(String ID) async {
    String name = await DBRef.child("heartbeat-c4532")
        .child("00010203-0405-0607-0809-0a0b0c0d0e0f")
        .once()
        .asStream()
        .first
        .then((snap) {
      Map<dynamic, dynamic> map = snap.value;
      return map.values.first["SensorID"];
    });
    return name;
  }

  void list() async {
    await for (DataSnapshot data in DBRef.child("heartbeat-c4532")
        .child("00010203-0405-0607-0809-0a0b0c0d0e0f")
        .once()
        .asStream()) {
      Map<dynamic, dynamic> list = data.value;
      list.values.forEach((entry) {
        print(entry["beats"]);
      });
    }
  }

  dynamic data(String Id) async {
    DBRef.child("heartbeat-c4532").child(Id).once().asStream().listen((data) {
      Map<dynamic, dynamic> list = data.value;
      list.values.forEach((entry) {
        if( entry["danger"].toString() == "true" ) {
          notification.showOnGoingNotification(notification.notification, entry["SensorID"].toString(), "Seems in danger");
        }
      });
    });

    List<double> data1 = List<double>();
    String name;
    await for (DataSnapshot data
        in DBRef.child("heartbeat-c4532").child(Id).once().asStream()) {
      Map<dynamic, dynamic> list = data.value;
      list.values.forEach((entry) {
        data1.add(double.parse(entry["beats"].toString()));
        name = entry["SensorID"].toString();
      });
    }
    return [name, data1];
  }
}

UserService user = UserService();
