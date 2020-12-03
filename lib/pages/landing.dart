import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:kingzcourt/widgets/drawer.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentIndex = 0;

  List<BottomNavyBarItem> kingzNavBar = [
    BottomNavyBarItem(
      icon: Icon(Icons.map),
      title: Text('Open Gym'),
    ),
    BottomNavyBarItem(
      icon: Icon(Icons.people),
      title: Text('Tournament'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text(widget.title),
      ),
      drawer: KingzDrawer(),
      // bottomNavigationBar: BottomNavyBar(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   selectedIndex: currentIndex,
      //   showElevation: true,
      //   itemCornerRadius: 9.0,
      //   onItemSelected: (index) => setState(() {
      //     currentIndex = index;
      //   }),
      //   items: kingzNavBar,
      // ),
    );
  }
}
