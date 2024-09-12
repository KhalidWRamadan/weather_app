import 'package:flutter/material.dart';

import 'package:weather_app/views/weather_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0b5495),
        appBar: AppBar(
          leading: const SizedBox(),
          title: const Center(child: Text('WeatherApp')),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ),
          ],
        ),
        body: const WeatherView());
  }
}
