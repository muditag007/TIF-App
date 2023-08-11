// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tif/features/home/bloc/home_bloc.dart';
import 'package:tif/features/home/ui/event_details.dart';
import 'package:tif/features/home/ui/events_page.dart';
import 'package:tif/features/home/ui/search_page.dart';

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        bloc: homeBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoadingState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case HomeInitialState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case HomeSuccessState:
              final successState = state as HomeSuccessState;
              return EventsPage(
                data: successState.data,
                homeBloc: homeBloc,
              );
            case HomeNavigateDetailState:
              final successState = state as HomeNavigateDetailState;
              return EventDetails(
                data: successState.data,
                homeBloc: homeBloc,
              );
            case HomeNavigateSearchState:
              final successState = state as HomeNavigateSearchState;
              return SearchPage(data: successState.data, homeBloc: homeBloc,);
            default:
              return Center(
                child: Text("Default State"),
              );
          }
        },
      ),
    );
  }
}
