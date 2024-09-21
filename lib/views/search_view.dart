import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('WeatherApp'),
        ),
        actions: const [
          SizedBox(
            width: 52,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              //calling the cubit in the place that will trigger the needed logic
              //we pass GetWeatherCubit so it can know the scope of this cubit
              GetWeatherCubit getWeatherCubit =
                  BlocProvider.of<GetWeatherCubit>(context);
              //triggering the getWeather method to fetch the data and pass
              //the entered city
              getWeatherCubit.getWeather(cityName: value);
              Navigator.of(context).pop();
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              suffixIcon: Icon(Icons.search),
              label: Text('Search'),
              hintText: 'Enter City Name',
              hintMaxLines: 1,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
