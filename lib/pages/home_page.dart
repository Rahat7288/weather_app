import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatheer_app/repositories/weather_repository.dart';
import 'package:weatheer_app/services/weather_api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  _fetchWeather() {
    WeatherRepository(
      weatherApiSerices: WeatherApiSerices(
        httpClient: http.Client(),
      ),
    ).fetchWeather('london');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
