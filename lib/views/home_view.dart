import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/no_weather_view.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/views/weather_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Center(child: Text('WeatherApp')),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const SearchView();
                  }),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
            colors: [
              Color(0xFF1D5D9B),
              Color(0xFF75C2F6),
            ],
          ),
        ),
        //build the block and change the state according to a condition
        //the bloc takes the cubit and it's states as a generic type
        child: BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            if (state is WeatherLoadedState) {
              return WeatherView(
                weatherInfo: state.weatherModel,
              );
            } else if (state is WeatherInitialState) {
              return const NoWeatherView();
            } else {
              return const Center(
                child: Text('An Error has occured, please try again later'),
              );
            }
          },
        ),
      ),
    );
  }
}
