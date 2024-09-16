import 'package:flutter/material.dart';
import 'package:weather_app/components/daily_listview_item.dart';
import 'package:weather_app/models/today_weather_model.dart';

class DailyListView extends StatelessWidget {
  const DailyListView(
      {super.key, required this.dailyWeather, required this.itemCount});
  final List<WeatherModel?>? dailyWeather;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: SizedBox(
          height: 165,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF1D5D9B),
                        const Color(0xFFE2E2B6).withOpacity(0),
                      ],
                    ),
                  ),
                  child: DailyListviewItem(weatherInfo: dailyWeather?[index]),
                );
              },
              itemCount: itemCount),
        ),
      ),
    );
  }
}
