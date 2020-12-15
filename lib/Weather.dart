import 'package:my_meteo/Utils.dart';

class Weather{

  final String name;
  final double temp;
  final int clouds;
  final double windSpeed;
  final int wheatherId;
  final String weatherName;
  final String description;
  final int iconId;


  Weather({this.name, this.temp, this.clouds, this.windSpeed, this.wheatherId,
      this.weatherName, this.description, this.iconId});

  factory Weather.fromJson(Map<String, dynamic> json){

    return Weather(name: json["name"], temp: Utils().kelvinToCelsius(json["main"]["temp"]), clouds: json["clouds"]["all"],
        wheatherId: json["weather"]["id"], weatherName: json["weather"]["main"], description: json["weather"]["description"], iconId: json["weather"]["icon"]);
  }


}