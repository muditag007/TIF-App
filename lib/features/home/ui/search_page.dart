// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tif/features/constants.dart';
import 'package:tif/features/home/bloc/home_bloc.dart';
import 'package:tif/features/utils/event_tile.dart';
import 'package:http/http.dart' as http;

import '../models/home_model.dart';

class SearchPage extends StatefulWidget {
  final Events data;
  final HomeBloc homeBloc;
  const SearchPage({super.key, required this.data, required this.homeBloc});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // String searchText = "";
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeNewSearchEvent(str: ""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top) /
        790;
    double width = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10,
          left: 24 * width,
          right: 24 * width,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 3,
                  ),
                  child: InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      widget.homeBloc.add(HomeInitialEvent());
                    },
                    child: Image.asset(
                      "images/arrow-left1.png",
                      height: 22 * height,
                      width: 22 * height,
                    ),
                  ),
                ),
                SizedBox(
                  width: 13 * width,
                ),
                Text(
                  "Search",
                  style: GoogleFonts.lato(
                    fontSize: 24 * height,
                    fontWeight: FontWeight.w500,
                    color: kBlack,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 31 * height,
            ),
            Row(
              children: [
                Image.asset(
                  "images/search1.png",
                  height: 22 * height,
                  width: 22 * height,
                ),
                SizedBox(
                  width: 10 * width,
                ),
                Container(
                  width: 2 * width,
                  height: 26 * height,
                  decoration: BoxDecoration(
                    color: kPurple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  width: 10 * width,
                ),
                Container(
                  height: 32 * height,
                  width: 277 * width,
                  child: TextField(
                    cursorColor: kPurple,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      // searchText = value;
                      homeBloc.add(HomeNewSearchEvent(str: value));
                    },
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: kTextFieldDecoration.copyWith(
                      // hintText:
                      labelText: "Type Event Name",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30 * height,
            ),
            Expanded(
              child: BlocConsumer(
                bloc: homeBloc,
                listener: (context, state) {},
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case HomeErrorState:
                      final successState = state as HomeErrorState;
                      return Center(
                        child: Text(
                          successState.error,
                        ),
                      );
                    case HomeNavigateSearchState:
                      return ListView.builder(
                        itemCount: widget.data.content!.data!.length,
                        itemBuilder: (context, index) {
                          return EventTile(
                            image: widget.data.content!.data![index].bannerImage
                                .toString(),
                            date: widget.data.content!.data![index].dateTime
                                .toString(),
                            name: widget.data.content!.data![index].title
                                .toString(),
                            location: widget
                                    .data.content!.data![index].venueName
                                    .toString() +
                                " • " +
                                widget.data.content!.data![index].venueCity
                                    .toString() +
                                ", " +
                                widget.data.content!.data![index].venueCountry
                                    .toString(),
                            homeBloc: widget.homeBloc,
                            id: widget.data.content!.data![index].id.toString(),
                          );
                        },
                      );
                    case HomeLoadingState:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case HomeNewSearchState:
                      final successState = state as HomeNewSearchState;
                      return ListView.builder(
                        itemCount: successState.data.content!.data!.length,
                        itemBuilder: (context, index) {
                          return EventTile(
                            image: successState
                                .data.content!.data![index].bannerImage
                                .toString(),
                            date: successState
                                .data.content!.data![index].dateTime
                                .toString(),
                            name: successState.data.content!.data![index].title
                                .toString(),
                            location: successState
                                    .data.content!.data![index].venueName
                                    .toString() +
                                " • " +
                                successState
                                    .data.content!.data![index].venueCity
                                    .toString() +
                                ", " +
                                successState
                                    .data.content!.data![index].venueCountry
                                    .toString(),
                            homeBloc: widget.homeBloc,
                            id: successState.data.content!.data![index].id
                                .toString(),
                          );
                        },
                      );
                    default:
                      return Center(
                        child: Text(
                          "Default State",
                        ),
                      );
                  }
                },
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: widget.data.content!.data!.length,
            //     itemBuilder: (context, index) {
            //       return EventTile(
            //         image: data.content!.data![index].bannerImage.toString(),
            //         date: data.content!.data![index].dateTime.toString(),
            //         name: data.content!.data![index].title.toString(),
            //         location: data.content!.data![index].venueName.toString() +
            //             " • " +
            //             data.content!.data![index].venueCity.toString() +
            //             ", " +
            //             data.content!.data![index].venueCountry.toString(),
            //         homeBloc: widget.homeBloc,
            //         id: data.content!.data![index].id.toString(),
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
