import 'package:dio/dio.dart';

class WeatherService {
  final Dio _dio = Dio();
  Future<Map<String, dynamic>?> getWeatherInfo(double? lat, double? lng) async {
    if (lat == null || lng == null) return null;

    try {
      Response response = await _dio.get(
          'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lng&current=temperature_2m,apparent_temperature,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=Africa%2FCairo&models=best_match');
      Map<String, dynamic> jsonData = response.data;
      return jsonData;
    } on DioException catch (e) {
      e.stackTrace;
      return null;
    }
  }
}
