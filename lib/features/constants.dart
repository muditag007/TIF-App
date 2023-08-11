// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Color kBlue = Color.fromRGBO(86, 105, 255, 1);
Color kBlack = Color.fromRGBO(18, 13, 38, 1);
Color kGrey = Color.fromRGBO(116, 118, 136, 1);
Color kPurple = Color.fromRGBO(121, 116, 231, 1);

const kTextFieldDecoration = InputDecoration(
  labelStyle: TextStyle(color: Color.fromRGBO(121, 116, 231, 1)),
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(121, 116, 231, 1), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(121, 116, 231, 1), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
