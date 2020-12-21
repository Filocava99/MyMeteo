import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_meteo/http/OWMClient.dart';
import 'package:my_meteo/meteo/Forecast.dart';
import 'package:my_meteo/utils/Utils.dart';

import 'Search.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _cityName = "";
  OWMClient _owmClient = OWMClient("621a656f252b4f5eb71989a3cb634ae4");

  Future<FiveDaysForecast> forecast;

  callback(String value) {
    setState(() {
      _cityName = value;
      forecast = _owmClient.getForecast(_cityName);
    });
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
          body: FutureBuilder<FiveDaysForecast>(
            future: forecast,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                    scrollDirection: Axis.vertical,
                    physics: AlwaysScrollableScrollPhysics(),
                    children: [
                      Container(
                          padding: EdgeInsets.all(30),
                          margin: EdgeInsets.fromLTRB(5, 20, 5, 30),
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
                                  snapshot.data.getCurrentWeatherImageUrl()),
                              Text(
                                  "${Utils.capitalizeFirtLetter(snapshot.data.getCurrentForecast().weather.description)}\n",
                                  style: GoogleFonts.roboto(
                                      fontSize: 28, color: Colors.white)),
                              Text(
                                  "$_cityName   ${snapshot.data.getCurrentForecast().weather.temp}°\n",
                                  style: GoogleFonts.roboto(
                                      fontSize: 28, color: Colors.white)),
                              Text(
                                  "Min.   ${snapshot.data.getCurrentForecast().weather.tempMin}°     /     Max.   ${snapshot.data.getCurrentForecast().weather.tempMax}°",
                                  style: GoogleFonts.roboto(
                                      fontSize: 20, color: Colors.white))
                            ],
                          )),
                      Container(
                        width: 100,
                        height: 150,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 70,
                                height: 100,
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
                                          color:
                                              Color.fromRGBO(28, 50, 189, 0.3),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: Offset(5, 2))
                                    ]),
                                child: Expanded(child: Column(children: [
                                  Image.network(
                                          "${snapshot.data.getNextFiveHours()[index].getWeatherImageUrl()}"),
                                  Text(
                                      "${snapshot.data.getNextFiveHours()[index].dateTime.hour}:00",
                                      style: GoogleFonts.roboto(
                                          fontSize: 16, color: Colors.white)),
                                  Text(
                                      "${snapshot.data.getNextFiveHours()[index].weather.temp}°",
                                      style: GoogleFonts.roboto(
                                          fontSize: 12, color: Colors.white))
                              ]),
                              ));
                            },
                            itemCount: 5),
                      ),
                      ListView.builder(shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Expanded(child: Column(children: [
                            Divider(
                              color: Colors.black12,
                              height: 20,
                              thickness: 1,
                              indent: 20,
                              endIndent: 0,
                            ),
                            Row(children: [
                              Expanded(child: Image.network(snapshot.data.getNextThreeDaysForecast()[index].getWeatherImageUrl())),
                              Expanded(child: Text(Utils.days[snapshot.data.getNextThreeDaysForecast()[index].dateTime.weekday],
                                  style: GoogleFonts.roboto(
                                      fontSize: 16, color: Colors.white))),
                              Expanded(child: Text("Min.   ${snapshot.data.getNextThreeDaysForecast()[index].weather.tempMin}°\nMax.   ${snapshot.data.getNextThreeDaysForecast()[index].weather.tempMax}°",
                                  style: GoogleFonts.roboto(
                                      fontSize: 16, color: Colors.white)))
                            ]),
                          ]));
                        },
                        itemCount: 3,
                        scrollDirection: Axis.vertical,
                      )
                    ]);
              }
              if (_cityName == "") {
                return Container(
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.fromLTRB(5, 20, 5, 30),
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
                    child: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "Search a city",
                            style: GoogleFonts.roboto(
                                fontSize: 28, color: Colors.white)),
                      ],
                    )));
              } else {
                return Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator()
                  ],
                ));
              }
            },
          )),
    );
  }
}
