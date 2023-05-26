import 'dart:developer';

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';

class CitiesPicker extends StatefulWidget {
  const CitiesPicker({super.key});

  @override
  State<CitiesPicker> createState() => _CitiesPickerState();
}

class _CitiesPickerState extends State<CitiesPicker> {
  late String countryValue;
  late String stateValue;
  late String cityValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country State and City Picker'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 600,
          child: Column(
            children: [
              SelectState(
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value;
                    log(countryValue);
                  });
                },
                onStateChanged: (value) {
                  setState(() {
                    stateValue = value;
                    log(stateValue);
                  });
                },
                onCityChanged: (value) {
                  setState(() {
                    cityValue = value;
                    log(cityValue);
                  });
                },
              ),
            ],
          )),
    );
  }
}
