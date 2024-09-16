import 'package:flutter/material.dart';
import 'package:weather_app/components/current_item.dart';
import 'package:weather_app/components/daily_listview.dart';
import 'package:weather_app/models/today_weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class CurrentWeatherBuilder extends StatefulWidget {
  const CurrentWeatherBuilder({super.key});

  @override
  State<CurrentWeatherBuilder> createState() => _CurrentWeatherBuilderState();
}

class _CurrentWeatherBuilderState extends State<CurrentWeatherBuilder> {
  late Future<Map<String, List<WeatherModel?>>?> future;
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
          return Column(
            children: [
              CurrentItem(
                data: snapshot.data!['current']![0]!,
              ),
              DailyListView(
                dailyWeather: snapshot.data!['daily'],
              ),
              DailyListView(
                dailyWeather: snapshot.data!['daily'],
              ),
            ],
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
