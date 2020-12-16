import 'dart:collection';

import 'file:///C:/Users/filip/Desktop/Workspaces/AndroidStudio/my_meteo/lib/meteo/Weather.dart';

class FiveDaysForecast {

  final Map<int, Map<int, Forecast>> _daysForecasts;

  FiveDaysForecast(this._daysForecasts);

  factory FiveDaysForecast.fromJson(Map<String, dynamic> json){
    String cityName = json["city"]["name"];
    Map<int, Map<int, Forecast>> days = HashMap();
    for (var node in json["list"]) {
      var date = DateTime.fromMillisecondsSinceEpoch(node["dt"] * 1000);
      Weather weather = Weather(
          name: cityName,
          temp: node["main"]["temp"]+.0,
          tempMin: node["main"]["temp_min"]+.0,
          tempMax: node["main"]["temp_max"]+.0,
          clouds: node["clouds"]["all"],
          windSpeed: node["wind"]["speed"]+.0,
          weatherId: node["weather"][0]["id"],
          weatherName: node["weather"][0]["main"],
          description: node["weather"][0]["description"],
          iconId: node["weather"][0]["icon"]
      );
      Forecast forecast = Forecast(weather, date);
      if(!days.containsKey(date.day)){
        days[date.day] = HashMap<int, Forecast>();
      }
      days[date.day][date.hour] = forecast;
    }
    return FiveDaysForecast(days);
  }

  Map<int, Map<int, Forecast>> get daysForecasts => _daysForecasts;
}

class Forecast {

  final Weather _weather;
  final DateTime _dateTime;

  Forecast(this._weather, this._dateTime);

  Weather get weather => _weather;

  DateTime get dateTime => _dateTime;
}