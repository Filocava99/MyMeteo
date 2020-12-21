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
      this._name,
      this._temp,
      this._tempMin,
      this._tempMax,
      this._clouds,
      this._windSpeed,
      this._weatherId,
      this._weatherName,
      this._description,
      this._iconId);

  factory Weather.fromJson(Map<String, dynamic> json) {
    print(json);
    return Weather(
        json["name"],
        json["main"]["temp"] + .0,
        json["main"]["temp_min"] + .0,
        json["main"]["temp_max"] + .0,
        json["clouds"]["all"],
        json["wind"]["speed"] + .0,
        json["weather"][0]["id"],
        json["weather"][0]["main"],
        json["weather"][0]["description"],
        json["weather"][0]["icon"]);
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
