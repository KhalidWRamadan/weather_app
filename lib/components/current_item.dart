import 'package:flutter/material.dart';
import 'package:weather_app/models/today_weather_model.dart';
import 'package:weather_app/models/weather_code.dart';

class CurrentItem extends StatelessWidget {
  const CurrentItem({super.key, required this.data});
  final WeatherModel? data;
  @override
  Widget build(BuildContext context) {
    const Color textColor = Colors.white;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.place,
                color: Color(0xFFFF9874),
              ),
              Text(
                data?.city ?? 'Gaza',
                style: const TextStyle(
                  color: textColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Last Update At ${data?.updateTime}',
                style: const TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              data?.weatherIcon ?? WeatherCode.clearSky.icon,
              Text(
                ' ${data?.currentTemp}\u00B0',
                style: const TextStyle(
                  color: textColor,
                  fontSize: 92,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                ' Feels like: ${data?.feelsTemp}\u00B0',
                style: const TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                data?.weatherDesc ?? 'Cloudy',
                style: const TextStyle(
                  color: textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${data?.day} ${data?.minTemp}\u00B0/${data?.maxTemp}\u00B0',
                style: const TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
