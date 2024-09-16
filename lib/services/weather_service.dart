import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/today_weather_model.dart';
import 'package:weather_app/models/weather_code.dart';
import 'package:weather_app/services/location_service.dart';

class WeatherService {
  final Dio _dio = Dio();

  Future<Map<String, List<WeatherModel>>?> getWeatherInfo(String? city) async {
    if (city == null) return null;
    List<double> location = await LocationService().getLocation(city);
    double lat = location[0];
    double lng = location[1];

    try {
      Response response = await _dio.get(
          'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lng&current=temperature_2m,apparent_temperature,weather_code&hourly=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto');
      Map<String, dynamic> jsonData = response.data;

      Map<String, List<WeatherModel>> weatherModels = {};

      Map<String, dynamic> currentWeatherData = jsonData['current'];
      Map<String, dynamic> dailyWeatherData = jsonData['daily'];

      double todayMinTemp = dailyWeatherData['temperature_2m_min'][0];
      double todayMaxTemp = dailyWeatherData['temperature_2m_max'][0];

      // Example date string returned by the weather API in "YYYY-MM-DD" format
      String currentWeatherDay =
          currentWeatherData['time']; // This is the date string
      //cutting the following hour After the Date
      String currentDate =
          currentWeatherDay.substring(0, currentWeatherDay.indexOf('T'));

      String updateTime = currentWeatherDay.substring(
          currentWeatherDay.indexOf('T') + 1, currentWeatherDay.length);
      // Step 1: Parse the date string into a DateTime object (local time)
      DateTime date =
          DateTime.parse(currentDate); // Converts to a DateTime object

      // Step 2: Get the abbreviated day of the week using DateFormat from intl package
      DateFormat dateFormat = DateFormat(
          'EEE'); // 'EEE' will return the abbreviated day name (e.g., Mon)
      String dayOfWeek = dateFormat.format(
          date); // Converts the DateTime object to abbreviated day of the week

      WeatherModel todayModel = WeatherModel(
        updateTime: updateTime,
        city: city,
        weatherIcon: _getIconFromCode(currentWeatherData['weather_code']),
        currentTemp: currentWeatherData['temperature_2m'].round(),
        feelsTemp: currentWeatherData['apparent_temperature'].round(),
        weatherDesc:
            _getDescriptionFromCode(currentWeatherData['weather_code']),
        day: dayOfWeek,
        minTemp: todayMinTemp.round(), //round the double value
        maxTemp: todayMaxTemp.round(),
      );
      weatherModels['current'] = [todayModel];

      weatherModels['daily'] = _getDayWeatherInfo(dailyWeatherData);

      return weatherModels;
    } on DioException catch (e) {
      e.stackTrace;
      return null;
    }
  }

  static String _getDescriptionFromCode(int code) {
    for (var weather in WeatherCode.values) {
      if (weather.code == code) {
        return weather.description;
      }
    }
    return 'Unknown code'; // Return a default value if code is not found
  }

  static Widget _getIconFromCode(int code) {
    for (var weather in WeatherCode.values) {
      if (weather.code == code) {
        return weather.icon;
      }
    }
    return WeatherCode
        .overcast.icon; // Return a default value if code is not found
  }

  List<WeatherModel> _getDayWeatherInfo(Map<String, dynamic> dailyWeatherData) {
    var minTemp = dailyWeatherData['temperature_2m_min'];
    var maxTemp = dailyWeatherData['temperature_2m_max'];
    var weatherCode = dailyWeatherData['weather_code'];
    List<Widget> dayWeatherIcon = [];
    List<int> avgTemp = [];
    int numberOfDays = 7;
    final List<WeatherModel> dailyWeatherModels = [];

    for (var i = 0; i < numberOfDays; i++) {
      avgTemp.add(((minTemp[i] + maxTemp[i]) / 2).round());
      dayWeatherIcon.add(_getIconFromCode(weatherCode[i]));

      dailyWeatherModels.add(
        WeatherModel(
          weatherIcon: dayWeatherIcon[i],
          currentTemp: avgTemp[i],
          day: 'Sun',
        ),
      );
    }
    return dailyWeatherModels;
  }
}
