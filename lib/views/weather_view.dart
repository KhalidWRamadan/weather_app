import 'package:flutter/material.dart';
import 'package:weather_app/components/current_weather_builder.dart';
import 'package:weather_app/components/daily_listview.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CurrentWeatherBuilder(),
        SizedBox(height: 200, child: DailyListView())
      ],
    );
  }
}
