import 'package:flutter/material.dart';
import 'package:weather_app/components/current_item.dart';
import 'package:weather_app/models/today_weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class CurrentWeatherBuilder extends StatefulWidget {
  const CurrentWeatherBuilder({super.key});

  @override
  State<CurrentWeatherBuilder> createState() => _CurrentWeatherBuilderState();
}

class _CurrentWeatherBuilderState extends State<CurrentWeatherBuilder> {
  late Future<TodayWeatherModel?> future;
  @override
  void initState() {
    future = WeatherService().getWeatherInfo('Gaza');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error has occured, please try again later.'),
          );
        }
        //data recived successfully
        if (snapshot.hasData) {
          return CurrentItem(
            data: snapshot.data!,
          );
          //no data recieved and no errors happened, show loading indicator
        } else {
          return const SizedBox(
            height: double.maxFinite,
            child: Column(
              children: [
                LinearProgressIndicator(
                  color: Color(0xFFffb200),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
