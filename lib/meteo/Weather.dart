import 'file:///C:/Users/filip/Desktop/Workspaces/AndroidStudio/my_meteo/lib/utils/Utils.dart';

class Weather {
  final String _name;
  final double _temp;
  final double _tempMin;
  final double _tempMax;
  final int _clouds;
  final double _windSpeed;
  final int _weatherId;
  final String _weatherName;
  final String _description;
  final String _iconId;

  Weather(
      {String name,
      double temp,
      double tempMin,
      double tempMax,
      int clouds,
      double windSpeed,
      int weatherId,
      String weatherName,
      String description,
      String iconId})
      : _name = name,
        _temp = temp,
        _tempMin = tempMin,
        _tempMax = tempMax,
        _clouds = clouds,
        _windSpeed = windSpeed,
        _weatherId = weatherId,
        _weatherName = weatherName,
        _description = description,
        _iconId = iconId;

  factory Weather.fromJson(Map<String, dynamic> json) {
    print(json);
    return Weather(
        name: json["name"],
        temp: json["main"]["temp"] + .0,
        tempMin: json["main"]["temp_min"] + .0,
        tempMax: json["main"]["temp_max"] + .0,
        clouds: json["clouds"]["all"],
        windSpeed: json["wind"]["speed"] + .0,
        weatherId: json["weather"][0]["id"],
        weatherName: json["weather"][0]["main"],
        description: json["weather"][0]["description"],
        iconId: json["weather"][0]["icon"]);
  }

  String get iconId => _iconId;

  String get description => _description;

  String get weatherName => _weatherName;

  int get weatherId => _weatherId;

  double get windSpeed => _windSpeed;

  int get clouds => _clouds;

  double get tempMax => _tempMax;

  double get tempMin => _tempMin;

  double get temp => _temp;

  String get name => _name;
}
