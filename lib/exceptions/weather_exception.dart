class WeatherExceeption implements Exception {
  String message;
  WeatherExceeption([this.message = 'Something went wrong']) {
    message = 'Weather Exception $message';
  }

  @override
  String toString() {
    return message;
  }
}
