import 'package:flutter/material.dart';
import 'package:kingzcourt/widgets/add_player_button.dart';
import 'package:kingzcourt/widgets/drawer.dart';
import 'package:flutter/widgets.dart';
import 'package:kingzcourt/widgets/refresh_game_button.dart';
import 'package:kingzcourt/widgets/active_player_widget.dart';
import 'package:kingzcourt/widgets/active_game_widget.dart';
import 'package:kingzcourt/widgets/playerpageicon.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/team_ihor.dart';

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
    Player player = Player("Alex", "Wallen", "OH", 0, "path/path");
    return Scaffold(
        appBar: AppBar(
          textTheme: Theme.of(context).textTheme,
          title: Text(widget.title),
        ),
        body: _buildBody(),
        drawer: KingzDrawer(),
        floatingActionButton: RefreshGameButton());
  }
}

Widget _buildBody() {
  return Column(
    children: [
      ActiveGameWidget(Team('Team 1', 6), Team('Team 2', 6)),
      Divider(),
      Text('Add Player Buton goes here'),
      Divider(),
      //Expanded(child: PlaylistWidget()),
    ],
  );
}
