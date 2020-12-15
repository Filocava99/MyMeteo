import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_meteo/HttpClient.dart';
import 'package:my_meteo/Weather.dart';

class OWMClient extends HttpClient{

  final openWeatherMapUrl = "api.openweathermap.org";
  final String forecastPath = "/data/2.5/forecast";
  final String weatherPath = "/data/2.5/weather";
  final String apiKey;

  OWMClient(this.apiKey);

  Future<Weather> getWeather(String city, {String stateCode, String countryCode}) async{
    Map<String, String> header = HashMap();
    stateCode = stateCode.isNotEmpty ? ","+stateCode : "";
    countryCode = countryCode.isNotEmpty ? ","+ countryCode : "";
    header["q"] = city + stateCode + countryCode;
    header["appid"] = apiKey;
    var uri = Uri.http(openWeatherMapUrl, weatherPath, header);
    Response response;
    if(client != null){
      response = await client.get(uri, headers: header);
    }else{
      response = await get(uri, headers: header);
    }
    if(response.statusCode == 200){
      return Weather.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to load weather');
    }
  }

}