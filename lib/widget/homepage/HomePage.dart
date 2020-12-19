import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_meteo/utils/Utils.dart';

import 'Search.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  String cityName = "Ravenna";

  callback(String value) {
    setState(() {cityName = value;});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search(callback));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Center(
          child: Column(children: [
            Container(
                padding: EdgeInsets.all(30),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    gradient: RadialGradient(colors: [
                      Color.fromRGBO(64, 80, 182, 0.4),
                      Color.fromRGBO(56, 79, 224, 0.4)
                    ]),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(28, 50, 189, 0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(7, 3))
                    ]),
                child: Column(
                  children: [
                    Image.network(
                        "http://openweathermap.org/img/wn/10d@4x.png"),
                    Text(
                        "Current temp in $cityName: x | Min temp: x | Max temp: x",
                        style: GoogleFonts.roboto(
                            fontSize: 16, color: Colors.white))
                  ],
                )),
            Expanded(
              child: SizedBox(
                height: 30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 70,
                        //height: 70,
                        //padding: EdgeInsets.all(5),
                        margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25),
                            gradient: RadialGradient(colors: [
                              Color.fromRGBO(64, 80, 182, 0.4),
                              Color.fromRGBO(56, 79, 224, 0.4)
                            ]),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(28, 50, 189, 0.3),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(5, 2))
                            ]),
                        child: Column(children: [
                          Image.network(
                              "http://openweathermap.org/img/wn/10d@2x.png"),
                          Text("Hour x",
                              style: GoogleFonts.roboto(
                                  fontSize: 16, color: Colors.white))
                        ]),
                      );
                    },
                    itemCount: 5),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(children: [
                  Divider(
                    color: Colors.black12,
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 0,
                  ),
                  Row(children: [
                    Image.network(
                        "http://openweathermap.org/img/wn/10d@2x.png"),
                    Text(Utils.days[index + 1],
                        style: GoogleFonts.roboto(
                            fontSize: 16, color: Colors.white))
                  ]),
                ]);
              },
              itemCount: 5,
              scrollDirection: Axis.vertical,
            ))
          ]),
        ),
      ),
    );
  }
}
