import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/services/auto_complete_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Center(
        child: Autocomplete(
          onSelected: (option) async {
            GetWeatherCubit getWeatherCubit =
                BlocProvider.of<GetWeatherCubit>(context);
            getWeatherCubit.getWeather(cityName: option);
            await Future<void>.delayed(const Duration(milliseconds: 1000));
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
          optionsBuilder: (textEditingValue) async {
            List<String>? suggestions = await AutoCompleteService()
                .getCityAutoComplete(textEditingValue.text.toLowerCase());

            return suggestions ?? [''];
          },
          //building the decoration
          fieldViewBuilder: (BuildContext context,
              TextEditingController textEditingController,
              FocusNode focusNode,
              VoidCallback onFieldSubmitted) {
            return TextField(
              controller: textEditingController,
              focusNode: focusNode,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                suffixIcon: Icon(Icons.search),
                label: Text('Search'),
                hintText: 'Enter City Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
