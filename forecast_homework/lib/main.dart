import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          title: const Text("Weather Forecast"),
          backgroundColor: Colors.deepOrange,
        ),
        body: _body(),
      ),
    );
  }
}

Widget _body() {
  return Container(
    padding: const EdgeInsets.only(left: 16, right: 16),
    child: Column(
      children: [
        const SizedBox(height: 10.0),
        _searchRow(),
        const SizedBox(height: 10.0),
        _palceAndDate(),
        const SizedBox(height: 45.0),
        _weatherInfo(),
        const SizedBox(height: 45.0),
        _dayForecast(),
        const SizedBox(height: 45.0),
        _weekForecast(),
      ],
    ),
  );
}

Widget _searchRow() {
  return const Row(
    children: [
      Icon(Icons.search, color: Colors.white),
      SizedBox(width: 16.0),
      Expanded(
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Enter City Name",
            labelStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
        ),
      ),
    ],
  );
}

Widget _palceAndDate() {
  return Container(
    alignment: Alignment.center,
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Murmansk Oblast, RU",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        SizedBox(height: 10.0),
        Text(
          "Friday, mar 20, 2020",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ],
    ),
  );
}

Widget _weatherInfo() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(
        Icons.sunny,
        size: 75,
        color: Colors.white,
      ),
      const SizedBox(width: 20.0),
      Column(
        children: [
          const Text(
            "14 °F",
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.w200),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "LIGHT SNOW",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      )
    ],
  );
}

Widget _dayForecast() {
  Widget _partDayForecast(
      {required IconData icon, required String temp, required String desc}) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(
          temp,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          desc,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  return Padding(
    padding: const EdgeInsets.only(left: 40, right: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _partDayForecast(icon: Icons.snowing, temp: "5", desc: "km/hr"),
        _partDayForecast(icon: Icons.snowing, temp: "3", desc: "%"),
        _partDayForecast(icon: Icons.snowing, temp: "20", desc: "%"),
      ],
    ),
  );
}

Widget _weekForecast() {
  var cards = [
    _forecastCard(dayOfWeek: "Monday", temp: "20 °F"),
    _forecastCard(dayOfWeek: "Tuesday", temp: "12 °F"),
    _forecastCard(dayOfWeek: "Wednesday", temp: "44 °F"),
    _forecastCard(dayOfWeek: "Thursday", temp: "17 °F"),
    _forecastCard(dayOfWeek: "Friday", temp: "10 °F"),
    _forecastCard(dayOfWeek: "Saturday", temp: "32 °F"),
    _forecastCard(dayOfWeek: "Sunday", temp: "27 °F"),
  ];

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

Card _forecastCard(
    {required String dayOfWeek,
    required String temp,
    IconData iconData = Icons.sunny}) {
  return Card(
    color: Colors.white.withOpacity(0.4),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayOfWeek,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                temp,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(
                width: 4,
              ),
              Icon(
                iconData,
                color: Colors.white,
                size: 30,
              )
            ],
          )
        ],
      ),
    ),
  );
}
