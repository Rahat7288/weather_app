// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weatheer_app/exceptions/weather_exception.dart';
import 'package:weatheer_app/models/custom_errors.dart';
import 'package:weatheer_app/models/weather.dart';
import 'package:weatheer_app/services/weather_api_services.dart';

class WeatherRepository {
  final WeatherApiSerices weatherApiSerices;
  WeatherRepository({
    required this.weatherApiSerices,
  });

  Future<Weather> fetchWeather(String city) async {
    try {
      final int woeid = await weatherApiSerices.getWoeid(city);
      print('woeid $woeid');
      final Weather weather = await weatherApiSerices.getWeater(woeid);
      print('wether $weather');
      return weather;
    } on WeatherExceeption catch (e) {
      throw CustomError(errMsg: e.message);
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
