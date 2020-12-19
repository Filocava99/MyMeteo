class Utils{
  final double kelvinToCelsiusConversionConst = 273.15;

  static final Utils _utils = Utils._internal();

  static final Map<int, String> days = {
    1: "Monday",
    2: "Thuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday"
  };

  factory Utils(){
    return _utils;
  }

  Utils._internal();

  double kelvinToCelsius(double kelvin){
    return kelvin-kelvinToCelsiusConversionConst;
  }
}