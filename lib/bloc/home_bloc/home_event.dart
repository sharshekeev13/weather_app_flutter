import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
// ignore: must_be_immutable
abstract class HomeEvent extends Equatable {
  String city;

  HomeEvent({required this.city});
}

// ignore: must_be_immutable
class HomeLoadEvent extends HomeEvent {
  HomeLoadEvent({required super.city});

  @override
  List<Object?> get props => [city];
}
