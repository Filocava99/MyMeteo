import 'dart:collection';

import 'package:my_meteo/Weather.dart';

class FiveDaysForecast {

  final Map<int, Map<int, Forecast>> _daysForecasts;

  FiveDaysForecast(this._daysForecasts);

  factory FiveDaysForecast.fromJson(Map<String, dynamic> json){
    String cityName = json["city"]["name"];
    Map<int, dynamic> days = HashMap();
    for (var key in json["list"]) {
      var node = json["list"][key];
      var date = DateTime.fromMillisecondsSinceEpoch(node["dt"] * 1000);
      Weather weather = Weather(
          name: cityName,
          temp: node["main"]["temp"],
          tempMin: node["main"]["temp_min"],
          tempMax: node["main"]["temp_max"],
          clouds: node["clouds"]["all"],
          windSpeed: node["wind"]["speed"],
          weatherId: node["weather"]["id"],
          weatherName: node["weather"]["main"],
          description: node["weather"]["description"],
          iconId: node["weather"]["icon"]
      );
      Forecast forecast = Forecast(weather, date);
      if(!days.containsKey(date.day)){
        days[date.day] = HashMap<int, Forecast>();
      }
      days[date.day][date.hour] = forecast;
    }
    return FiveDaysForecast(days);
  }

}

class Forecast {

  final Weather _weather;
  final DateTime _dateTime;

  Forecast(this._weather, this._dateTime);

}