import 'package:flutter/material.dart';

import 'package:kingzcourt/utility/theme.dart';
import 'package:kingzcourt/pages/landing.dart';

import 'utility/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kingzTheme(),
      home: LandingPage(title: "Court Royale"),
    );
  }
}
