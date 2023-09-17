import 'package:flutter/material.dart';
import 'package:forecast_homework/models/weather_forecast_daily.dart';

class WeatherInfoView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastDaily> snapshot;
  late final _forecastFirstItem = snapshot.data?.list?.firstOrNull;
  late final _icon = _forecastFirstItem?.getIconUrl();
  late final _temp = _forecastFirstItem?.temp?.day?.toStringAsFixed(0) ?? '?';
  late final _desc =
      _forecastFirstItem?.weather?.firstOrNull?.description ?? '';

  WeatherInfoView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _icon != null
            ? Image.network(_icon!, color: Colors.white, scale: 0.6)
            : const Icon(Icons.location_city, size: 75, color: Colors.white),
        const SizedBox(width: 20.0),
        Column(
          children: [
            Text(
              "$_temp °C",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w200),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                _desc,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        )
      ],
    );
  }
}
