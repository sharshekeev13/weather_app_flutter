import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/models/weather.dart';

class HourlyForecast extends StatelessWidget {
  final Weather weather;

  const HourlyForecast({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    log(DateTime.now().toString());
    String hourTime = DateFormat.Hm().format(DateTime.now()).substring(0, 2);
    List<Hour> hours = weather.forecast!.forecastday!
        .firstWhere((element) {
          return element.date == DateTime.now().toString().substring(0, 10);
        })
        .hour!
        .where(((element) =>
            int.parse(hourTime) - 2 <=
                int.parse(element.time!.substring(11, 13)) &&
            int.parse(hourTime) + 1 >=
                int.parse(element.time!.substring(11, 13))))
        .toList();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: BoxDecoration(
        color: const Color(0xFF001026),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                Text(
                  'Mar, 9',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              _hourConteiner(hours[0], false),
              _hourConteiner(hours[1], false),
              _hourConteiner(hours[2], true),
              _hourConteiner(hours[3], false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _hourConteiner(Hour hour, bool selected) {
    log(hour.condition!.icon!.substring(2));
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: selected
            ? const Color(0XFF2566A3).withOpacity(.2)
            : Colors.transparent,
        border: selected
            ? Border.all(
                color: const Color(0xFF5096FF),
              )
            : null,
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${hour.tempC}°',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.network('https://${hour.condition!.icon!.substring(2)}'),
          Text(
            hour.time!.substring(11),
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
