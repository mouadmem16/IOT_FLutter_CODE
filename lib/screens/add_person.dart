import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class AddPerson extends StatefulWidget {
  final StreamController<String> controller;

  AddPerson(this.controller);

  @override
  _State createState() => _State();
}

class _State extends State<AddPerson> {
  static final _key = GlobalKey<FormState>();
  String userId = "test";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(children: [
        Form(
            key: _key,
            child: TextFormField(
              onChanged: (val) => userId = val,
              decoration: InputDecoration(labelText: "ID de l'utilisateur"),
              validator: (val) =>
                  (val.length < 6) ? "Entrer un ID valide" : null,
            )),
        SizedBox(height: 40.0),
        OutlineButton(
          onPressed: () async {
            if (_key.currentState.validate()) {
              sleep(Duration(microseconds: 1000));
              widget.controller.add(userId);
              Navigator.pop(context);
            }
          },
          child: Center(
            child: Text("Ajouter"),
          ),
        )
      ]),
    );
  }
}
