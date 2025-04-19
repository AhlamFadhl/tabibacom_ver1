import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tabibacom_ver1/shared/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  iconTheme: IconThemeData(color: Colors.black),
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: primaryColor),
  colorScheme: ThemeData().colorScheme.copyWith(primary: primaryColor),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: primaryColor,
    elevation: 0.0,
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Almarai'),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 10.0,
      color: Colors.black,
    ),
  ),
  fontFamily: 'Almarai',
);
