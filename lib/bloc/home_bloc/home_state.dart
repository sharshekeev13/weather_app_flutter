import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/models/weather.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class HomeLoadedState extends HomeState {
  Weather weather;

  HomeLoadedState({required this.weather});

  @override
  List<Object?> get props => [weather];
}

// ignore: must_be_immutable
class HomeErrorState extends HomeState {
  String error;

  HomeErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
