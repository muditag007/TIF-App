// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tif/features/constants.dart';
import 'package:tif/features/home/bloc/home_bloc.dart';

import '../models/event_model.dart';

class EventDetails extends StatefulWidget {
  final EventDesc data;
  final HomeBloc homeBloc;
  const EventDetails({super.key, required this.data, required this.homeBloc});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top) /
        790;
    double width = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      body: Column(
        children: [
          Container(
            // width: double.infinity,
            width: 375 * width,
            height: 244 * height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.data.content!.data!.bannerImage.toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: 24 * width,
                right: 24 * width,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        "images/arrow-left.png",
                        height: 22 * height,
                        width: 22 * height,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 13 * width,
                  ),
                  Text(
                    "Event Details",
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    width: 36 * width,
                    height: 36 * height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0x4cffffff),
                    ),
                    child: Center(
                      child: Image.asset(
                        'images/bookmark.png',
                        height: 15 * height,
                        width: 15 * width,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 21 * height,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24 * width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.content!.data!.title.toString(),
                  style: GoogleFonts.lato(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 16 * height,
                ),
                Row(
                  children: [
                    Container(
                      width: 48 * width,
                      height: 48 * height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.data.content!.data!.organiserIcon.toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromRGBO(239, 240, 255, 1),
                      ),
                    ),
                    SizedBox(
                      width: 14 * width,
                    ),
                    Container(
                      height: 48 * height,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5 * height,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.data.content!.data!.organiserName
                                  .toString(),
                              style: GoogleFonts.lato(
                                fontSize: 16 * height,
                                color: kBlack,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Organizer",
                              style: GoogleFonts.lato(
                                fontSize: 12 * height,
                                color: kGrey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24 * height,
                ),
                Row(
                  children: [
                    Container(
                      width: 48 * width,
                      height: 48 * height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromRGBO(239, 240, 255, 1),
                      ),
                      child: Center(
                        child: Image.asset(
                          "images/Calendar.png",
                          height: 30 * height,
                          width: 30 * width,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 14 * width,
                    ),
                    Container(
                      height: 48 * height,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5 * height,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.data.content!.data!.dateTime.toString(),
                              style: GoogleFonts.lato(
                                fontSize: 16 * height,
                                color: kBlack,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              widget.data.content!.data!.dateTime.toString(),
                              style: GoogleFonts.lato(
                                fontSize: 12 * height,
                                color: kGrey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24 * height,
                ),
                Row(
                  children: [
                    Container(
                      width: 48 * width,
                      height: 48 * height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromRGBO(239, 240, 255, 1),
                      ),
                      child: Center(
                        child: Image.asset(
                          "images/Location.png",
                          height: 30 * height,
                          width: 30 * width,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 14 * width,
                    ),
                    Container(
                      height: 48 * height,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5 * height,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.data.content!.data!.venueName.toString(),
                              style: GoogleFonts.lato(
                                fontSize: 16 * height,
                                color: kBlack,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              widget.data.content!.data!.venueCity.toString() +
                                  ", " +
                                  widget.data.content!.data!.venueCountry
                                      .toString(),
                              style: GoogleFonts.lato(
                                fontSize: 12 * height,
                                color: kGrey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 33 * height,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20 * width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Event",
                  style: GoogleFonts.lato(
                    fontSize: 18 * height,
                    color: kBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 8 * height,
                ),
                Text(
                  widget.data.content!.data!.description.toString(),
                  style: GoogleFonts.lato(
                    fontSize: 16 * height,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.only(
              bottom: 20 * height,
            ),
            child: Container(
              width: 271 * width,
              height: 58 * height,
              decoration: BoxDecoration(
                color: kBlue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10 * width),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'images/Group 4.png',
                      color: Colors.transparent,
                    ),
                    Text(
                      "BOOK NOW",
                      style: TextStyle(
                        fontSize: 16 * height,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset('images/Group 4.png')
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
