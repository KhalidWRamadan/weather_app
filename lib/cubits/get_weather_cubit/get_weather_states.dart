//weather states is created to be passed to the cubit
//the main reason is that we can make all the states inheriet it
//and then have access through all states via the partent class
import 'package:weather_app/models/today_weather_model.dart';

class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final Map<String, List<WeatherModel>>? weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherStates {}
