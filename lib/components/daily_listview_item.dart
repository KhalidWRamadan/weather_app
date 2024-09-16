import 'package:flutter/material.dart';
import 'package:weather_app/models/today_weather_model.dart';
import 'package:weather_app/models/weather_code.dart';

class DailyListviewItem extends StatelessWidget {
  const DailyListviewItem({super.key, required this.weatherInfo});
  final WeatherModel? weatherInfo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            weatherInfo?.day ?? '',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(
            child: weatherInfo?.weatherIcon ?? WeatherCode.clearSky.icon,
          ),
          Text(
            '${weatherInfo?.currentTemp}\u00B0',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
