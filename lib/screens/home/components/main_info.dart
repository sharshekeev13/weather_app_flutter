import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather.dart';

class MainInfo extends StatelessWidget {
  final Weather weather;

  const MainInfo({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int day = weather.forecast!.forecastday!.indexWhere(
        (element) => element.date == now.toString().substring(0, 10));
    Forecastday day1 = weather.forecast!.forecastday![day];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/Sun cloud angled rain.png'),
        Text(
          '${weather.current!.tempC!.toInt()}°',
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 64,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Precipitations',
          style: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.white, fontSize: 18),
        ),
        Text(
          'Max.: ${day1.day!.maxtempC}°, Min.: ${day1.day!.mnumempC}°',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 31,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF001026),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _getInfoWidget(
                  'noun-rain.png', '${day1.day!.dailyChanceOfRain}%'),
              const SizedBox(
                width: 35,
              ),
              _getInfoWidget('humidity.png', '${day1.day!.avghumidity}%'),
              const SizedBox(
                width: 35,
              ),
              _getInfoWidget('noun-wind.png', '${day1.day!.maxwindKph}km/h'),
            ],
          ),
        )
      ],
    );
  }

  Widget _getInfoWidget(String image, String text) {
    return Row(
      children: [
        Image.asset('assets/$image'),
        Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
