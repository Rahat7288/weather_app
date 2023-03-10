// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String weatherStateName;
  final String weatherStateAbbr;
  final String created;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final String title;
  final int woeid;
  final DateTime lastUpdated;
  Weather({
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.created,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.title,
    required this.woeid,
    required this.lastUpdated,
  });
//   generating json form to use with the api
  factory Weather.fromJson(Map<String, dynamic> json) {
    final consolidatedWeather = json['consolidated_weather'][0];
    return Weather(
        weatherStateName: consolidatedWeather['weather_state_name'],
        weatherStateAbbr: consolidatedWeather['weather_state_abbr'],
        created: consolidatedWeather['created'],
        minTemp: consolidatedWeather['min_temp'],
        maxTemp: consolidatedWeather['max_temp'],
        theTemp: consolidatedWeather['the_temp'],
        title: consolidatedWeather['title'],
        woeid: consolidatedWeather['woeid'],
        lastUpdated: DateTime.now());
  }
//  generating initial model to interect with the cubit
  factory Weather.initial() => Weather(
        weatherStateName: '',
        weatherStateAbbr: '',
        created: '',
        minTemp: 100.0,
        maxTemp: 100.0,
        theTemp: 100.0,
        title: '',
        woeid: -1,
        lastUpdated: DateTime(1970),
      );

  @override
  List<Object> get props {
    return [
      weatherStateName,
      weatherStateAbbr,
      created,
      minTemp,
      maxTemp,
      theTemp,
      title,
      woeid,
      lastUpdated,
    ];
  }

  @override
  bool get stringify => true;

  // @override
  // String toString() {
  //   return 'Weather(weatherStateName: $weatherStateName, weatherStateAbbr: $weatherStateAbbr, created: $created, minTemp: $minTemp, maxTemp: $maxTemp, theTemp: $theTemp, title: $title, woeid: $woeid, lastUpdated: $lastUpdated)';
  // }

  Weather copyWith({
    String? weatherStateName,
    String? weatherStateAbbr,
    String? created,
    double? minTemp,
    double? maxTemp,
    double? theTemp,
    String? title,
    int? woeid,
    DateTime? lastUpdated,
  }) {
    return Weather(
      weatherStateName: weatherStateName ?? this.weatherStateName,
      weatherStateAbbr: weatherStateAbbr ?? this.weatherStateAbbr,
      created: created ?? this.created,
      minTemp: minTemp ?? this.minTemp,
      maxTemp: maxTemp ?? this.maxTemp,
      theTemp: theTemp ?? this.theTemp,
      title: title ?? this.title,
      woeid: woeid ?? this.woeid,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
