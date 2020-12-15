import 'dart:collection';

import 'package:my_meteo/Forecast.dart';
import 'package:my_meteo/OWMClient.dart';
import 'package:my_meteo/Weather.dart';
import 'package:test/test.dart';

void main() {
  test('Weather test. The city name should be \'Provincia di Ravenna\'', () async {
    OWMClient owmClient = OWMClient("621a656f252b4f5eb71989a3cb634ae4");
    Weather weather = await owmClient.getWeather("Ravenna");
    expect(weather.name, "Provincia di Ravenna");
  });

  test('Forecast test. Every forecast temp should be greater than -20 degrees.', () async {
    OWMClient owmClient = OWMClient("621a656f252b4f5eb71989a3cb634ae4");
    FiveDaysForecast fiveDaysForecast = await owmClient.getForecast("Ravenna");
    fiveDaysForecast.daysForecasts.forEach((day, hours) {
      hours.forEach((hour, forecast) {
        expect(forecast.weather.temp, greaterThan(-20));
      });
    });
  });
}