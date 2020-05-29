import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iot_heartbeats/screens/chart_of_id.dart';
import 'package:iot_heartbeats/services/user.dart';

import '../widgets/loading.dart';

class ListUsers extends StatefulWidget {
  final StreamController<String> controller;

  ListUsers(this.controller);

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: StreamBuilder(
        stream: widget.controller.stream,
        builder: (context, snapshot) {
          if (snapshot.data == null)
            return Loading();
          else {
            user.IDs.add(snapshot.data);
            return ListView.builder(
                itemCount: user.IDs.length,
                itemBuilder: (context, ind) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.lightBlue[300],
                          borderRadius: BorderRadius.circular(10.0)),
                      child: ListTile(
                        title: Text(
                          "Test",
                          style: TextStyle(fontSize: 20),
                        ),
                        leading: Icon(
                          Icons.perm_identity,
                          size: 60,
                        ),
                        subtitle:
                            Text("Number of HeartBeats : " + "90.0" + " Bpm"),
                        onTap: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                        body: Loading(),
                                      )));
                          dynamic data1 = await user
                              .data("00010203-0405-0607-0809-0a0b0c0d0e0f");
                          List<double> data = data1[1];
                          String name = data1[0];
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ChartOfId(name, data);
                          }));
                        },
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
