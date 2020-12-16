import 'package:flutter/material.dart';

import 'Search.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  String prova;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search());
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Center(
          child: Text("Sometext"),
        ));
  }
}