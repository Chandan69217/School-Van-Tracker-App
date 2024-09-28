

import 'package:flutter/material.dart';
import 'package:school_route/utilities/color_theme.dart';
import 'package:sizing/sizing.dart';

ThemeData MyThemeData(){
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: ColorTheme.yellow,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: ColorTheme.gray_dark,
          fontSize: 30.ss,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',),
      headlineMedium: TextStyle(color: ColorTheme.gray_dark,fontSize: 18.ss,fontFamily: 'Poppins'),
        headlineSmall: TextStyle(color: ColorTheme.gray_dark,fontSize: 14.ss,fontFamily: 'Poppins'),
        titleMedium: TextStyle(color: ColorTheme.gray_dark,fontSize: 18.ss,fontFamily: 'Poppins',)
    ),

    );
}