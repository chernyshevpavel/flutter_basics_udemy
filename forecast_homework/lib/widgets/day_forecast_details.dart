import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forecast_homework/models/weather_forecast_daily.dart';

class DayForecatsDetailsView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastDaily> snapshot;
  late final _forecastFirstItem = snapshot.data?.list?.firstOrNull;
  late final _preassure =
      ((_forecastFirstItem?.pressure ?? 0).toDouble() * 0.75)
          .toInt()
          .toString();
  late final _humidity = _forecastFirstItem?.humidity?.toString() ?? '-';
  late final _speed = _forecastFirstItem?.speed?.toInt().toString() ?? '-';

  DayForecatsDetailsView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _partDayForecast(
              icon: FontAwesomeIcons.temperatureThreeQuarters,
              temp: _preassure,
              desc: "mm hg"),
          _partDayForecast(
              icon: FontAwesomeIcons.cloudRain, temp: _humidity, desc: "%"),
          _partDayForecast(
              icon: FontAwesomeIcons.wind, temp: _speed, desc: "m/s"),
        ],
      ),
    );
  }

  Widget _partDayForecast(
      {required IconData icon, required String temp, required String desc}) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          temp,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          desc,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
