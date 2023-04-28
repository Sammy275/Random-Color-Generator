import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherService {
  static const String _openWeatherAPIKey = "3c2e984a28d1a179bcf51a506af15396";
  static const String _openWeatherEndPoint =
      "https://api.openweathermap.org/data/2.5/weather";

  /// Returns a temperature from weather API
  /// Temperature
  static Future<double> getTemperatureFromAPI(
      double latitude, double longitude) async {
    final Uri url = Uri.parse(
        "$_openWeatherEndPoint?lat=$latitude&lon=$longitude&appid=$_openWeatherAPIKey");

    final http.Response response;
    try {
      response = await http.get(url);
    } catch (e) {
      throw Exception('Please check your internet');
    }

    final Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;

    final double temperature;
    try {
      temperature = double.parse(data['main']['temp'].toString()) -
          273.15; // Converting from Kelvins to Celsius
    } catch (e) {
      throw Exception('Invalid coordinates provided');
    }

    return temperature;
  }
}
