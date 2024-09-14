import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocationService {
  final Dio _dio = Dio();

  Future<List<double>> getLocation(String city) async {
    String? apiKey = dotenv.env['location_api_key'];
    try {
      late double lat;
      late double lng;
      Response response = await _dio.get(
          'https://api.opencagedata.com/geocode/v1/json?q=$city&key=$apiKey');
      Map<String, dynamic> jsonData = response.data;
      lat = jsonData['results'][0]['geometry']['lat'];
      lng = jsonData['results'][0]['geometry']['lng'];
      return [lat, lng];
    } on DioException catch (_) {
      return [];
    }
  }
}
