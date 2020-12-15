import 'dart:collection';

import 'package:my_meteo/OWMClient.dart';
import 'package:my_meteo/Weather.dart';
import 'package:test/test.dart';

void main() {
  test('GET test. Http response should be 200', () async {
    OWMClient owmClient = OWMClient("621a656f252b4f5eb71989a3cb634ae4");
    Weather weather = await owmClient.getWeather("Ravenna");
    expect(weather.name, "Provincia di Ravenna");
  });
}