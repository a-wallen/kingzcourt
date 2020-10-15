import 'package:flutter/material.dart';

ThemeData appTheme() {
  double myelevation = 10.0;
  double margins = 5.0;
  double borderRadius = 5.0;
  TextTheme _basicText(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1.copyWith(
        fontFamily: 'SansitaSwashed',
        color: Colors.red,
      ),
    );
  }

  AppBarTheme _appbarTheme(AppBarTheme base) {
    return base.copyWith(
      centerTitle: true,
      color: Colors.white,
      elevation: myelevation,
    );
  }

  BottomAppBarTheme _bottombarTheme(BottomAppBarTheme base) {
    return base.copyWith(
      color: Colors.white,
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
    textTheme: _basicText(base.textTheme),
  );
}
