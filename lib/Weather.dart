import 'package:my_meteo/Utils.dart';

class Weather {
  final String name;
  final double temp;
  final double tempMin;
  final double tempMax;
  final int clouds;
  final double windSpeed;
  final int weatherId;
  final String weatherName;
  final String description;
  final String iconId;

  Weather(
      {this.name,
      this.temp,
      this.tempMin,
      this.tempMax,
      this.clouds,
      this.windSpeed,
      this.weatherId,
      this.weatherName,
      this.description,
      this.iconId});

  factory Weather.fromJson(Map<String, dynamic> json) {
    print(json);
    return Weather(
        name: json["name"],
        temp: json["main"]["temp"],
        tempMin: json["main"]["temp_min"],
        tempMax: json["main"]["temp_max"],
        clouds: json["clouds"]["all"],
        windSpeed: json["wind"]["speed"],
        weatherId: json["weather"][0]["id"],
        weatherName: json["weather"][0]["main"],
        description: json["weather"][0]["description"],
        iconId: json["weather"][0]["icon"]);
  }
}
