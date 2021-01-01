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
      title: base.title.copyWith(
          fontFamily: 'SansitaSwashed',
          fontWeight: FontWeight.w700,
          color: AppColors.primaryColor),
      body2: base.body2.copyWith(
          fontFamily: 'SansitaSwashed',
          fontWeight: FontWeight.w700,
          color: Colors.white,
          fontSize: 16),
      body1: base.body1.copyWith(
        fontFamily: 'SansitaSwashed',
        fontWeight: FontWeight.w700,
        color: AppColors.primaryDarkColor,
        fontSize: 16,
      ),
    );
  }

  AppBarTheme _appbarTheme(AppBarTheme base) {
    return base.copyWith(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
      color: Colors.transparent,
      brightness: Brightness.light,
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

  FloatingActionButtonThemeData _floatingActionButtonTheme(
      FloatingActionButtonThemeData base) {
    return base.copyWith(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      splashColor: AppColors.primaryAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    canvasColor: AppColors.accentColor,
    textTheme: _basicText(base.textTheme),
    appBarTheme: _appbarTheme(base.appBarTheme),
    bottomAppBarTheme: _bottombarTheme(base.bottomAppBarTheme),
    cardTheme: _cardTheme(base.cardTheme),
    floatingActionButtonTheme:
        _floatingActionButtonTheme(base.floatingActionButtonTheme),
  );
}
