import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorsModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<ColorsModel>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              "Homework Provider",
              style: TextStyle(color: value.barColor),
            ),
          ),
          body: child,
        ),
        child: _body(),
      ),
    );
  }
}

class ColorsModel extends ChangeNotifier {
  Color _barColor;
  Color _containerColor;

  Color get barColor => _barColor;
  Color get containerColor => _containerColor;

  ColorsModel()
      : _barColor = Colors.lightBlue,
        _containerColor = Colors.lightBlue;

  void setRandomColors() {
    _barColor = _getRandomColor();
    _containerColor = _getRandomColor();
    notifyListeners();
  }

  Color _getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }
}

Widget _body() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _container(),
        StateSwitch(),
      ],
    ),
  );
}

Widget _container() {
  return Consumer<ColorsModel>(
    builder: (context, value, child) => AnimatedContainer(
      height: 200,
      width: 200,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: value.containerColor,
      ),
    ),
  );
}

class StateSwitch extends StatefulWidget {
  const StateSwitch({super.key});

  @override
  State<StateSwitch> createState() => _StateSwitch();
}

class _StateSwitch extends State<StateSwitch> {
  bool _state = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: _state,
        onChanged: (value) {
          setState(() {
            _state = !_state;
          });
          Provider.of<ColorsModel>(context, listen: false).setRandomColors();
        });
  }
}
