import 'package:flutter/material.dart';
import 'package:forecast_homework/models/weather_forecast_daily.dart';
import 'package:forecast_homework/utilities/date_util.dart';

class CityAndDateView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastDaily> snapshot;
  late var city = snapshot.data?.city?.name ?? '';
  late var country = snapshot.data?.city?.country ?? '';
  late var dateFormatted = () {
    final date = DateTime.fromMillisecondsSinceEpoch(
        (snapshot.data?.list?.firstOrNull?.dt ??
                DateTime.now().millisecondsSinceEpoch) *
            1000);
    return DateUtil.formattedDate(date);
  }();

  CityAndDateView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$city $country',
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(height: 10.0),
          Text(
            dateFormatted,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
