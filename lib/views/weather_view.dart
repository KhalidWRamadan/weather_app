import 'package:flutter/material.dart';
import 'package:weather_app/components/hourly_listview.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.place,
              color: Color(0xFFffb200),
            ),
            Text(
              'London',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(
              Icons.cloud,
              color: Colors.white,
              size: 64,
            ),
            Text(
              ' 18\u00B0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 124,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              ' Feels like: 16\u00B0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Cloudy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Tue 16\u00B0/24\u00B0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 200, child: HourlyListView())
          ],
        ),
      ),
    );
  }
}
