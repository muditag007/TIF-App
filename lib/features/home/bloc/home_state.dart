part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeInitialState extends HomeState {}

class HomeSuccessState extends HomeState {
  final Events data;

  HomeSuccessState({required this.data});
}

class HomeSearchSuccessState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeNavigateDetailState extends HomeState {
  final EventDesc data;

  HomeNavigateDetailState({required this.data});
}

class HomeNavigateSearchState extends HomeState {
  final Events data;

  HomeNavigateSearchState({required this.data});
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState({required this.error});
}

class HomeNewSearchState extends HomeState {
  final Events data;

  HomeNewSearchState({required this.data});
}
