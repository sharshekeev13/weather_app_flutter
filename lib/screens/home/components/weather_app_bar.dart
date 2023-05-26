import 'package:flutter/material.dart';
import 'package:weather_app/screens/cities/cities.dart';

class WeatherAppBar extends StatelessWidget {
  const WeatherAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: ListTile(
        title: Row(
          children: [
            Image.asset('assets/map.png'),
            const SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CitiesPicker()));
              },
              child: const Text(
                'London',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Image.asset(
              'assets/opt.png',
              alignment: Alignment.center,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
        trailing: Image.asset('assets/notif.png'),
      ),
    );
  }
}
