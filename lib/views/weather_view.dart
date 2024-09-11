import 'package:flutter/material.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
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
          Icon(
            Icons.cloud,
            color: Colors.white,
            size: 64,
          ),
          Text(
            ' 18\u00B0',
            style: TextStyle(
              color: Colors.white,
              fontSize: 148,
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
          )
        ],
      ),
    );
  }
}
