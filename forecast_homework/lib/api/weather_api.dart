import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:forecast_homework/constants.dart';
import 'package:forecast_homework/models/weather_forecast_daily.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecastDaily> getWeatherForecast(
      {required String cityName}) async {
    final queryParams = {
      "appid": Constants.WEATHER_APP_ID,
      "q": cityName,
      "units": Constants.WEATHER_UNIT,
    };

    final uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, queryParams);

    log(uri.toString());
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      return Future.error('Error response');
    }

    return WeatherForecastDaily.fromJson(json.decode(response.body));
  }
}
