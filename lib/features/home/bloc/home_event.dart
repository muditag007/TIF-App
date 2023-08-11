part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeSearchClickEvent extends HomeEvent {}

class HomeEventClickEvent extends HomeEvent {
  final String id;

  HomeEventClickEvent({required this.id});
}

class HomeNewSearchEvent extends HomeEvent {
  final String str;

  HomeNewSearchEvent({required this.str});
}
