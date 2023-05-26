import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/home_bloc/home_event.dart';
import 'package:weather_app/bloc/home_bloc/home_state.dart';
import 'package:weather_app/repositories/weather_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherRepository weatherRepository;
  HomeBloc(this.weatherRepository) : super(HomeLoadingState()) {
    on<HomeLoadEvent>(((event, emit) async {
      emit(HomeLoadingState());
      try {
        final weather = await weatherRepository.getWeather(event.city);
        log(weather.toString());
        emit(HomeLoadedState(weather: weather));
      } catch (e) {
        emit(HomeErrorState(error: e.toString()));
      }
    }));
  }
}
