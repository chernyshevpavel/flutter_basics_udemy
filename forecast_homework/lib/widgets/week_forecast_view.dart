import 'package:flutter/material.dart';
import 'package:forecast_homework/models/weather_forecast_daily.dart';
import 'package:forecast_homework/widgets/day_forecast_card.dart';
import 'package:intl/intl.dart';

class WeekForecastView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastDaily> snapshot;

  const WeekForecastView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    List<DayForecastCard> cards = snapshot.data?.list?.map((e) {
          final seconds =
              (e.dt ?? DateTime.now().millisecondsSinceEpoch) * 1000;
          final date = DateTime.fromMillisecondsSinceEpoch(seconds);
          final temp = e.temp?.day?.toInt().toString() ?? '-';
          final imgUrl = e.getIconUrl();
          return DayForecastCard(
            dayOfWeek: DateFormat('EEE').format(date),
            temp: "$temp °C",
            iconUrl: imgUrl,
          );
        }).toList() ??
        [];

    return Column(
      children: [
        const Text(
          "7-DAY WEATHER FORECAST",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            itemExtent: 150,
            itemBuilder: (BuildContext context, int index) {
              return cards[index];
            },
          ),
        ),
      ],
    );
  }
}
