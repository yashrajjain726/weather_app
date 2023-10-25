import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/core/errors/exception.dart';

import 'package:weather_app/features/data/models/weather_model.dart';
import 'dart:convert';

class ApiClient {
  final http.Client httpClient;

  ApiClient({required this.httpClient});
  Future<WeatherModel> getWeatherData(Position position) async {
    final response = await httpClient.get(
      Uri.parse(
          "${ApiConstants.BASE_URL}?lat=${position.latitude}&lon=${position.longitude}&appid=${ApiConstants.API_KEY}&units=metric"),
      headers: {'content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
