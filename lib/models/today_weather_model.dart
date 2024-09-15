import 'package:flutter/material.dart';

class TodayWeatherModel {
  final String city;
  final String updateTime;
  final Widget? weatherIcon;
  final num currentTemp;
  final num feelsTemp;
  final String weatherDesc;
  final String day;
  final num minTemp;
  final num maxTemp;

  TodayWeatherModel(
      {required this.city,
      required this.updateTime,
      required this.weatherIcon,
      required this.currentTemp,
      required this.feelsTemp,
      required this.weatherDesc,
      required this.day,
      required this.minTemp,
      required this.maxTemp});
}
