import 'package:flutter/material.dart';
import 'package:my_meteo/widget/homepage/HomePage.dart';
import 'package:my_meteo/widget/homepage/Search.dart';

void main() {
  runApp(MainWidget());
}

class MainWidget extends StatelessWidget {

  final String _title = "My Meteo";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: _title),
    );
  }
}