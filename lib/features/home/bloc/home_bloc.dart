// ignore_for_file: unused_local_variable, unused_import

import 'dart:async';
import 'dart:convert' as convert;
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tif/features/home/models/event_model.dart';
import 'package:tif/features/home/models/home_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeSearchClickEvent>(homeSearchClickEvent);
    on<HomeEventClickEvent>(homeEventClickEvent);
    on<HomeNewSearchEvent>(homeNewSearchEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeInitialState());
    emit(HomeLoadingState());
    try {
      final response = await http.get(Uri.parse(
          'https://sde-007.api.assignment.theinternetfolks.works/v1/event'));
      final data = Events.fromJson(json.decode(response.body));
      print(data);
      emit(HomeSuccessState(data: data));
    } catch (e) {
      emit(HomeErrorState(error: e.toString()));
    }
  }

  Future<FutureOr<void>> homeSearchClickEvent(
      HomeSearchClickEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final response = await http.get(Uri.parse(
          'https://sde-007.api.assignment.theinternetfolks.works/v1/event'));
      final data = Events.fromJson(json.decode(response.body));
      emit(HomeNavigateSearchState(data: data));
    } catch (e) {
      emit(HomeErrorState(error: e.toString()));
    }
  }

  Future<FutureOr<void>> homeEventClickEvent(
      HomeEventClickEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final response = await http.get(Uri.parse(
          'https://sde-007.api.assignment.theinternetfolks.works/v1/event/${event.id}'));
      final data = EventDesc.fromJson(json.decode(response.body));
      emit(HomeNavigateDetailState(data: data));
    } catch (e) {
      emit(HomeErrorState(error: e.toString()));
    }
  }

  Future<FutureOr<void>> homeNewSearchEvent(
      HomeNewSearchEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final response = await http.get(Uri.parse(
          'https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=${event.str}'));
      final data = Events.fromJson(json.decode(response.body));
      print(data.content!.meta!.total.toString());
      emit(HomeNewSearchState(data: data));
    } catch (e) {
      emit(HomeErrorState(error: e.toString()));
    }
  }
}
