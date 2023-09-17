import 'package:flutter/material.dart';
import 'package:forecast_homework/screens/weather_forecast_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WeatherForecastScreen());
  }
}
