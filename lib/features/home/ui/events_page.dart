// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tif/features/home/bloc/home_bloc.dart';
import 'package:tif/features/utils/event_tile.dart';

import '../models/home_model.dart';

class EventsPage extends StatefulWidget {
  final Events data;
  final HomeBloc homeBloc;
  const EventsPage({super.key, required this.data, required this.homeBloc});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top) /
        790;
    double width = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 24 * width,
          right: 24 * width,
        ),
        child: Column(
          children: [
            Container(
              height: 36 * height,
              child: Center(
                child: Row(
                  children: [
                    Text(
                      "Events",
                      style: GoogleFonts.lato(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        widget.homeBloc.add(HomeSearchClickEvent());
                      },
                      child: Image.asset(
                        'images/search.png',
                        height: 24 * height,
                        width: 24 * width,
                      ),
                    ),
                    SizedBox(
                      width: 16 * width,
                    ),
                    Image.asset(
                      'images/more-vertical.png',
                      height: 24 * height,
                      width: 24 * width,
                    ),
                    // SizedBox(
                    //   width: 24 * width,
                    // ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.data.content!.data!.length,
                itemBuilder: (context, index) {
                  return EventTile(
                    image: widget.data.content!.data![index].bannerImage
                        .toString(),
                    date: widget.data.content!.data![index].dateTime.toString(),
                    name: widget.data.content!.data![index].title.toString(),
                    location: widget.data.content!.data![index].venueName
                            .toString() +
                        " • " +
                        widget.data.content!.data![index].venueCity.toString() +
                        ", " +
                        widget.data.content!.data![index].venueCountry
                            .toString(),
                    homeBloc: widget.homeBloc,
                    id: widget.data.content!.data![index].id.toString(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
