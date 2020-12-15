import 'dart:collection';

import 'package:my_meteo/OWMClient.dart';
import 'package:my_meteo/Weather.dart';
import 'package:test/test.dart';

void main() {
  test('Weather test. The city name should be \'Provincia di Ravenna\'', () async {
    OWMClient owmClient = OWMClient("621a656f252b4f5eb71989a3cb634ae4");
    Weather weather = await owmClient.getWeather("Ravenna");
    expect(weather.name, "Provincia di Ravenna");
  });

  test('Forecast test. ', () async {
    OWMClient owmClient = OWMClient("621a656f252b4f5eb71989a3cb634ae4");
    await owmClient.getForecast("Ravenna");
  });
}