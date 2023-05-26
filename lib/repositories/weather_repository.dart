import 'dart:convert';

import 'package:http/http.dart';

import '../data/models/weather.dart';

class WeatherRepository {
  static const _apiKey = '99a394c52e8e4f68a2871545232505';
  Future<Weather> getWeather(String city) async {
    String endpoint =
        'https://api.weatherapi.com/v1/forecast.json?key=$_apiKey&q=$city&days=7&aqi=no&alerts=no';
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return Weather.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
