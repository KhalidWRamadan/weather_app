import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_states.dart';
import 'package:weather_app/models/today_weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  //passing the first state to the cubit class
  GetWeatherCubit() : super(InitialState());

  getWeather({required String cityName}) async {
    try {
      Map<String, List<WeatherModel>>? weatherInfo =
          await WeatherService().getWeatherInfo(cityName);
      //emit is used to send a state to the ui so the ui can be updated
      emit(WeatherLoadedState());
    } catch (_) {
      emit(ErrorState());
    }
  }
}
