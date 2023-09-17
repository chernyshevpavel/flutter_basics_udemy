import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DayForecastCard extends StatelessWidget {
  final String _dayOfWeek;
  final String _temp;
  final String? _iconUrl;

  const DayForecastCard({
    super.key,
    required String dayOfWeek,
    required String temp,
    String? iconUrl,
  })  : _dayOfWeek = dayOfWeek,
        _temp = temp,
        _iconUrl = iconUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.4),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _dayOfWeek,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _temp,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(
                  width: 4,
                ),
                _iconUrl != null
                    ? Image.network(
                        _iconUrl!,
                        color: Colors.white,
                        scale: 1.5,
                      )
                    : const Icon(FontAwesomeIcons.thermometer,
                        color: Colors.white, size: 30)
              ],
            )
          ],
        ),
      ),
    );
  }
}
