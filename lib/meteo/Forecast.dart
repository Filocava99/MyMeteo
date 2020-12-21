import 'dart:collection';

import 'file:///C:/Users/filip/Desktop/Workspaces/AndroidStudio/my_meteo/lib/meteo/Weather.dart';

class FiveDaysForecast {

  final Map<int, Map<int, Forecast>> _daysForecasts;

  FiveDaysForecast(this._daysForecasts);

  //Cache for better performance
  List<Forecast> _nextThreeDaysForecast;

  //Cache for better performance
  List<Forecast> _nextFiveHoursForecast;


  Forecast getCurrentForecast(){
    return _daysForecasts[DateTime.now().weekday].values.first;
  }

  String getCurrentWeatherImageUrl(){
    return getCurrentForecast().getWeatherImageUrl();
  }

  List<Forecast> getNextThreeDaysForecast(){
    if(_nextThreeDaysForecast == null){
      int begin = DateTime.now().weekday;
      int daysCount = 0;
      List<Forecast> daysForecast = List();
      for(int i = begin; i <= 7 && daysCount < 3; i++){
        daysForecast.add(_daysForecasts[i].values.first);
        if(i == 7){
          i = 1;
        }
        daysCount++;
      }
      _nextThreeDaysForecast = daysForecast;
      return daysForecast;
    }else{
      return _nextThreeDaysForecast;
    }
  }

  List<Forecast> getNextFiveHours(){
    if(_nextFiveHoursForecast == null){
      int begin = DateTime.now().weekday;
      int hoursCount = 0;
      List<Forecast> forecasts = List();
      for(int i = begin; i <= 7 && hoursCount < 5; i++) {
        Map<int, Forecast> dayHours = _daysForecasts[i];
        List<int> sortedKeys = dayHours.keys.toList();
        sortedKeys.sort();
        for (int key in sortedKeys) {
          forecasts.add(dayHours[key]);
          hoursCount++;
          if (hoursCount == 5) {
            break;
          }
        }
        if (i == 7) i = 1;
      }
      _nextFiveHoursForecast = forecasts;
      return forecasts;
    }else{
      return _nextFiveHoursForecast;
    }
  }

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
      if(!days.containsKey(date.weekday)){
        days[date.weekday] = HashMap<int, Forecast>();
      }
      days[date.weekday][date.hour] = forecast;
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

  String getWeatherImageUrl(){
    return "http://openweathermap.org/img/wn/${_weather.iconId}@4x.png";
  }
}