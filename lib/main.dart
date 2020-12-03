import 'package:flutter/material.dart';

import 'package:kingzcourt/utility/theme.dart';
import 'package:kingzcourt/pages/landing.dart';

import 'utility/theme.dart';

import 'db_testing.dart';

void main() {
  db_test();
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
