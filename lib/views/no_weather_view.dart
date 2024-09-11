import 'package:flutter/material.dart';

class NoWeatherView extends StatelessWidget {
  const NoWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Choose a city to view weather details!',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
