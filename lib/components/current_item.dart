import 'package:flutter/material.dart';
import 'package:weather_app/components/daily_listview.dart';
import 'package:weather_app/models/today_weather_model.dart';

class CurrentItem extends StatelessWidget {
  const CurrentItem({super.key, required this.data});
  final TodayWeatherModel data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.place,
              color: Color(0xFFffb200),
            ),
            Text(
              data.city,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Last Update At ${data.updateTime}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Icon(
              data.weatherIcon,
              color: Colors.white,
              size: 64,
            ),
            Text(
              ' ${data.currentTemp}\u00B0',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 124,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              ' Feels like: ${data.feelsTemp}\u00B0',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              data.weatherDesc,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '${data.day} ${data.minTemp}\u00B0/${data.maxTemp}\u00B0',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
