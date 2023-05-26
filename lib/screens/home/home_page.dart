import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/home_bloc/home_bloc.dart';
import 'package:weather_app/bloc/home_bloc/home_event.dart';
import 'package:weather_app/bloc/home_bloc/home_state.dart';
import 'package:weather_app/repositories/weather_repository.dart';

import '../../data/models/weather.dart';
import 'components/hourly_forecast.dart';
import 'components/main_info.dart';
import 'components/weather_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<WeatherRepository>(context),
      )..add(HomeLoadEvent(city: 'London')),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return Center(
              child: Container(
                  constraints: const BoxConstraints.expand(),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Color(0xFF08244F),
                        Color(0xFF134CB5),
                        Color(0xFF0B42AB),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Waiting',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  )),
            );
          } else if (state is HomeLoadedState) {
            Weather weather = state.weather;
            return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 1),
                    colors: <Color>[
                      Color(0xFF08244F),
                      Color(0xFF134CB5),
                      Color(0xFF0B42AB),
                    ],
                    tileMode: TileMode.mirror,
                  ),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Column(
                    children: [
                      const WeatherAppBar(),
                      MainInfo(
                        weather: weather,
                      ),
                      HourlyForecast(weather: weather),
                    ],
                  ),
                ));
          } else if (state is HomeErrorState) {
            return Center(
              child: Text(state.error),
            );
          }
          return Container();
        },
      ),
    );
  }
}
