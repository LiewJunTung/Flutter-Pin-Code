// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: 'Hardware Key Demo',
    home: Scaffold(
        appBar: AppBar(
          title: const Text('Hardware Key Demo'),
        ),
        body: App()),
  ));
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  FocusNode focusNode = new FocusNode();
  String text = "";
  int numText = 4;
  List<String> strList = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < numText; i++) {
      strList.add("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print("focus");
              FocusScope.of(context).requestFocus(focusNode);
            },
            child: Container(
                height: 100.0,
                child: ListView.builder(
                  itemCount: strList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    print(strList);
                    Container(
                      child: Center(child: Text("eau")),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2.0)),
                      width: 50.0,
                      height: 50.0,
                    );
                  },
                )),
          ),
          TextField(
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.transparent,
            ),
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              border: InputBorder.none,
            ),
            cursorColor: Colors.transparent,
            onChanged: (val) {
              setState(() {
                text = val;
                print(val);
                for (var i = 0; i < numText; i++) {
                  if (text.length > strList.length) {
                    strList.add("");
                  } else {
                    strList.add("\u25CF");
                  }
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
