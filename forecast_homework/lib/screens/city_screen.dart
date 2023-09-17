import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String _cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('City'),
      ),
      body: Container(
          color: Colors.deepOrange,
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Expanded(
                    child: TextField(
                      obscureText: false,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        icon: Icon(Icons.search, color: Colors.white),
                        fillColor: Colors.white,
                        labelText: "Enter City Name",
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        _cityName = value;
                      },
                    ),
                  ),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.orangeAccent;
                  }
                  return Colors.orange;
                })),
                onPressed: () {
                  Navigator.pop(context, _cityName);
                },
                child: const Text(
                  'Get weather',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )),
    );
  }
}
