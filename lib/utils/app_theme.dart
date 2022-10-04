import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final primaryColor = HexColor('#4CAF50');
const blackColor = Colors.black;
const whiteColor = Colors.white;
final greyColor = Colors.grey.shade600;
// final fillTextFormColor = HexColor("#C5C5C5");

final appTheme = ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(color: Colors.green),

  /// text form field theme
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    errorMaxLines: 3,
    labelStyle: TextStyle(
        fontSize: 15,
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontFamily: 'NotoSansArabic'),
    floatingLabelStyle: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.normal,
        fontFamily: 'NotoSansArabic'),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 2)),
    border: UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
    errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2)),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 1)),
    disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 1)),
    prefixIconColor: primaryColor,
    suffixIconColor: primaryColor,
  ),

  ///icons theme
  iconTheme: IconThemeData(color: primaryColor),
  textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
);
