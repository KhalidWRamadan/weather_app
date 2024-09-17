import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_code.dart';

class WeatherModel {
  final String? city;
  final String? updateTime;
  final Widget weatherIcon;
  final num currentTemp;
  final num? feelsTemp;
  final String? weatherDesc;
  final String day;
  final num? minTemp;
  final num? maxTemp;

  WeatherModel(
      {required this.weatherIcon,
      required this.currentTemp,
      required this.day,
      this.updateTime,
      this.city,
      this.feelsTemp,
      this.weatherDesc,
      this.minTemp,
      this.maxTemp});

  factory WeatherModel.fromJson(Map<String, dynamic> json, String city) {
    return WeatherModel(
        weatherIcon: _getIconAndDescreptionFromCode(
            json['current']['weather_code'])['icon'],
        currentTemp: json['current']['temperature_2m'].round(),
        day: _convertDateToDay(
          json['current']['time'].substring(
            0,
            json['current']['time'].indexOf('T'),
          ),
        ),
        updateTime: json['current']['time'].substring(
          json['current']['time'].indexOf('T') + 1,
          json['current']['time'].length,
        ),
        city: city,
        feelsTemp: json['current']['apparent_temperature'].round(),
        weatherDesc: _getIconAndDescreptionFromCode(
            json['current']['weather_code'])['desc'],
        minTemp: json['daily']['temperature_2m_min'][0],
        maxTemp: json['daily']['temperature_2m_max'][0]);
  }

  static Map<String, dynamic> _getIconAndDescreptionFromCode(int code) {
    Map<String, dynamic> res = {};
    for (var weather in WeatherCode.values) {
      if (weather.code == code) {
        res['icon'] = weather.icon;
        res['desc'] = weather.description;
        return res;
      }
    }
    return res; // Return a default value if code is not found
  }

  static String _convertDateToDay(String date) {
    // Step 1: Parse the date string into a DateTime object (local time)
    DateTime dateTime = DateTime.parse(date); // Converts to a DateTime object

    // Step 2: Get the abbreviated day of the week using DateFormat from intl package
    DateFormat dateFormat = DateFormat(
        'EEE'); // 'EEE' will return the abbreviated day name (e.g., Mon)
    String dayOfWeek = dateFormat.format(
        dateTime); // Converts the DateTime object to abbreviated day of the week
    return dayOfWeek;
  }
}
