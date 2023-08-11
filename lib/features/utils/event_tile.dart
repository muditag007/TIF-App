// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tif/features/constants.dart';
import 'package:tif/features/home/bloc/home_bloc.dart';

class EventTile extends StatefulWidget {
  final String image;
  final String date;
  final String name;
  final String location;
  final String id;
  final HomeBloc homeBloc;
  const EventTile({
    super.key,
    required this.image,
    required this.date,
    required this.name,
    required this.location,
    required this.homeBloc,
    required this.id,
  });

  @override
  State<EventTile> createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> {
  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top) /
        790;
    double width = MediaQuery.of(context).size.width / 375;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12 * height),
      child: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          widget.homeBloc.add(
            HomeEventClickEvent(
              id: widget.id,
            ),
          );
        },
        child: Container(
          height: 106 * height,
          width: 327 * width,
          // color: Colors.red,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.image,
                    height: 106 * height,
                    width: 80 * width,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 4 * width,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 9 * height,
                    ),
                    Text(
                      widget.date,
                      style: GoogleFonts.lato(
                        fontSize: 13 * height,
                        color: kBlue,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 5 * height,
                    ),
                    Container(
                      // height: 40,
                      width: 270,
                      child: Text(
                        widget.name,
                        style: GoogleFonts.lato(
                          fontSize: 15 * height,
                          color: kBlack,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                    SizedBox(
                      height: 11 * height,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "images/map-pin.png",
                          height: 14 * height,
                          width: 14 * width,
                        ),
                        Container(
                          width: 225 * width,
                          child: Text(
                            widget.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(
                              fontSize: 13 * height,
                              color: kGrey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
