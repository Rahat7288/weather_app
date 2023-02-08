// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatheer_app/exceptions/weather_exception.dart';
import 'package:weatheer_app/services/http_error_handler.dart';

import '../models/weather.dart';

class WeatherApiSerices {
  final http.Client httpClient;
  WeatherApiSerices({
    required this.httpClient,
  });

  Future<int> getWoeid(String city) async {
    final Uri uri = Uri(
        scheme: 'https',
        // host: kHost,
        path: '/api/location/search/',
        queryParameters: {'query': city});
    try {
      final http.Response response = await http.get(uri);
      if (response.statusCode != 200) {
        throw Exception(HttpEerrorHandler(response));
      }
      final responseeBody = json.decode(response.body);

      if (responseeBody.isEmpty) {
        throw WeatherExceeption('Cannot get the woeid of $city');
      }
      if (responseeBody.lenght > 1) {
        throw WeatherExceeption(
            'there are multiple candidates for $city please specify more');
      }
      return responseeBody[0]['woeid'];
    } catch (e) {
      rethrow;
    }
  }

  Future<Weather> getWeater(int woeid) async {
    final Uri uri = Uri(
      scheme: 'http',
      path: '/api/location/$woeid',
    );
    try {
      final http.Response response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(response);
      }

      final weatherJson = json.decode(response.body);
      final Weather weather = Weather.fromJson(weatherJson);
      print(weather);
      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
