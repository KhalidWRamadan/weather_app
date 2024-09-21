import 'package:flutter/material.dart';

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
              //WeatherModel weatherModel = await WeatherService().getWeatherInfo(value);
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
