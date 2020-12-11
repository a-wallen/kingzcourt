import 'package:flutter/material.dart';
import 'package:kingzcourt/widgets/add_player_button.dart';
import 'package:kingzcourt/widgets/drawer.dart';
import 'package:flutter/widgets.dart';
import 'package:kingzcourt/widgets/refresh_game_button.dart';
import 'package:kingzcourt/widgets/active_player_widget.dart';
import 'package:kingzcourt/widgets/active_game_widget.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text(widget.title),
      ),
      body: ActivePlayerWidget(), //AddPlayerButton(),
      drawer: KingzDrawer(),
      floatingActionButton: RefreshGameButton(),
    );
  }
}
