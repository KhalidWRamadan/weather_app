import 'package:flutter/material.dart';
import 'package:weather_app/components/current_item.dart';
import 'package:weather_app/components/daily_listview.dart';
import 'package:weather_app/models/today_weather_model.dart';

class WeatherView extends StatelessWidget {
  final Map<String, List<WeatherModel>>? weatherInfo;
  const WeatherView({super.key, required this.weatherInfo});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CurrentItem(
            data: weatherInfo?['current']?[0],
          ),
          DailyListView(dailyWeather: weatherInfo?['hourly'], itemCount: 24),
          DailyListView(dailyWeather: weatherInfo?['daily'], itemCount: 7)
        ],
      ),
    );
  }
}
