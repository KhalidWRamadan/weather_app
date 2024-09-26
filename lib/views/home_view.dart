import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/services/auto_complete_service.dart';
import 'package:weather_app/views/no_weather_view.dart';
import 'package:weather_app/views/weather_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: _isSearching
            ? typeAheadField(context)
            : const Center(
                child: Text('WeatherApp'),
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
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
            if (state is WeatherLoadingState) {
              return const LinearProgressIndicator();
            } else if (state is WeatherLoadedState) {
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

  TypeAheadField<String> typeAheadField(BuildContext context) {
    return TypeAheadField(
      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: true,
          onSubmitted: (value) => setState(() {
            _isSearching = false;
          }),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'City',
          ),
        );
      },
      suggestionsCallback: (pattern) async {
        // Implement suggestion logic here
        List<String>? suggestions = await AutoCompleteService()
            .getCityAutoComplete(pattern.toLowerCase());

        return suggestions ?? List<String>.empty();
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion),
        );
      },
      onSelected: (suggestion) {
        GetWeatherCubit getWeatherCubit =
            BlocProvider.of<GetWeatherCubit>(context);
        getWeatherCubit.getWeather(cityName: suggestion);
        setState(() {
          _isSearching = false;
        });
      },
    );
  }
}
