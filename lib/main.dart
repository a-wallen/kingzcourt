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
      theme: kingzTheme(),
      home: LandingPage(title: "King's Court"),
    );
  }
}
