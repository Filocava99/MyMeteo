class Utils{
  final double kelvinToCelsiusConversionConst = 273.15;

  static final Utils _utils = Utils._internal();

  factory Utils(){
    return _utils;
  }

  Utils._internal();

  double kelvinToCelsius(double kelvin){
    return kelvin-kelvinToCelsiusConversionConst;
  }
}