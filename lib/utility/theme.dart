//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingzcourt/classes/colors.dart';

double cornerRadius = 9.0;

ThemeData kingzTheme() {
  double myelevation = 10.0;
  double margins = 5.0;
  double borderRadius = 5.0;

  TextTheme _basicText(TextTheme base) {
    return base.copyWith(
      title: base.headline1.copyWith(
          fontFamily: 'SansitaSwashed',
          fontWeight: FontWeight.w700,
          color: AppColors.primaryColor),
    );
  }

  AppBarTheme _appbarTheme(AppBarTheme base) {
    return base.copyWith(
      centerTitle: true,
      color: AppColors.primaryDarkColor,
    );
  }

  BottomAppBarTheme _bottombarTheme(BottomAppBarTheme base) {
    return base.copyWith(
      color: AppColors.primaryDarkColor,
      elevation: myelevation,
    );
  }

  CardTheme _cardTheme(CardTheme base) {
    return base.copyWith(
      color: Colors.white,
      elevation: myelevation,
      margin: EdgeInsets.all(margins),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    canvasColor: AppColors.accentColor,
    textTheme: _basicText(base.textTheme),
    appBarTheme: _appbarTheme(base.appBarTheme),
    bottomAppBarTheme: _bottombarTheme(base.bottomAppBarTheme),
    cardTheme: _cardTheme(base.cardTheme),
  );
}
