import 'package:my_meteo/Utils.dart';

class Weather{

  final String name;
  final double temp;
  final int clouds;
  final double windSpeed;
  final int wheatherId;
  final String weatherName;
  final String description;
  final String iconId;


  Weather({this.name, this.temp, this.clouds, this.windSpeed, this.wheatherId,
      this.weatherName, this.description, this.iconId});

  factory Weather.fromJson(Map<String, dynamic> json){
    print(json);
    return Weather(name: json["name"], temp: Utils().kelvinToCelsius(json["main"]["temp"]), clouds: json["clouds"]["all"], windSpeed: json["wind"]["speed"],
        wheatherId: json["weather"][0]["id"], weatherName: json["weather"][0]["main"], description: json["weather"][0]["description"], iconId: json["weather"][0]["icon"]);
  }


}