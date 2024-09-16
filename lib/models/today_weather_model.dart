import 'package:flutter/material.dart';

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
}
