import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_meteo/HttpClient.dart';
import 'package:my_meteo/Weather.dart';

import 'Forecast.dart';

class OWMClient extends HttpClient {
  final _openWeatherMapUrl = "api.openweathermap.org";
  final String _forecastPath = "/data/2.5/forecast";
  final String _weatherPath = "/data/2.5/weather";
  final String _apiKey;

  OWMClient(this._apiKey);

  Future<Weather> getWeather(String city, {String stateCode = "", String countryCode = ""}) async {
    Map<String, String> header = HashMap();
    if (stateCode != "") stateCode = "," + stateCode;
    if (countryCode != "") countryCode = "," + countryCode;
    header["q"] = city + stateCode + countryCode;
    header["appid"] = apiKey;
    header["units"] = "metric";
    var uri = Uri.http(_openWeatherMapUrl, _weatherPath, header);
    Response response = await get(uri, headers: header);
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<FiveDaysForecast> getForecast(String city, {String stateCode = "", String countryCode = ""}) async{
    Map<String, String> header = HashMap();
    if (stateCode != "") stateCode = "," + stateCode;
    if (countryCode != "") countryCode = "," + countryCode;
    header["q"] = city + stateCode + countryCode;
    header["appid"] = apiKey;
    header["units"] = "metric";
    var uri = Uri.http(_openWeatherMapUrl, _forecastPath, header);
    Response response = await get(uri, headers: header);
    if (response.statusCode == 200) {
      return FiveDaysForecast.fromJson(jsonDecode(response.body));
    } else {
    throw Exception('Failed to load weather');
    }
  }
}
