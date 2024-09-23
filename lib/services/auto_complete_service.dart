import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AutoCompleteService {
  Dio dio = Dio();
  Future<List<String>?> getCityAutoComplete(String input) async {
    try {
      List<String> citySuggestions = [];
      String? apiKey = dotenv.env['auto_complete_api'];
      Response response = await dio.get(
          'https://api.geoapify.com/v1/geocode/autocomplete?text=$input&apiKey=$apiKey');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> features = jsonData['features'];
      if (features.isEmpty) {
        throw Exception('Invalid City name');
      } else {
        for (var feature in features) {
          String cityName = feature['properties']['city'];
          //String city = feature['properties']['city'];
          citySuggestions.add(cityName);
        }
      }
      return citySuggestions;
    } catch (_) {
      return null;
    }
  }
}
