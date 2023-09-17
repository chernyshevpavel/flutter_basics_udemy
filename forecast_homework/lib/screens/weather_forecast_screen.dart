import 'package:flutter/material.dart';
import 'package:forecast_homework/api/weather_api.dart';
import 'package:forecast_homework/models/weather_forecast_daily.dart';
import 'package:forecast_homework/screens/city_screen.dart';
import 'package:forecast_homework/widgets/city_and_date_view.dart';
import 'package:forecast_homework/widgets/day_forecast_details.dart';
import 'package:forecast_homework/widgets/weather_info_view.dart';
import 'package:forecast_homework/widgets/week_forecast_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecastDaily> _weatherForecastDaily;
  late final api = WeatherApi();
  String _cityName = 'Bangkok';

  @override
  void initState() {
    super.initState();
    _weatherForecastDaily = api.getWeatherForecast(cityName: _cityName);
    _weatherForecastDaily.then((weatherForecast) {
      print(weatherForecast.list?.first.weather?.first.main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: const Text("Weather Forecast"),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return CityScreen();
              }));
              if (_cityName != tappedName) {
                _cityName = tappedName;
                setState(() {
                  _weatherForecastDaily =
                      api.getWeatherForecast(cityName: _cityName);
                });
              }
            },
            icon: const Icon(Icons.location_city),
          ),
        ],
      ),
      body: FutureBuilder<WeatherForecastDaily>(
        future: _weatherForecastDaily,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _body(snapshot: snapshot);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}

Widget _body({required AsyncSnapshot<WeatherForecastDaily> snapshot}) {
  return Container(
    padding: const EdgeInsets.only(left: 16, right: 16),
    child: Column(
      children: [
        const SizedBox(height: 45.0),
        CityAndDateView(snapshot: snapshot),
        const SizedBox(height: 45.0),
        WeatherInfoView(snapshot: snapshot),
        const SizedBox(height: 45.0),
        DayForecatsDetailsView(snapshot: snapshot),
        const SizedBox(height: 45.0),
        WeekForecastView(snapshot: snapshot),
      ],
    ),
  );
}
