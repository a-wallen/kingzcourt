import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingzcourt/algorithms/matching_algo_ihor.dart';
import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/team_ihor.dart';
import 'package:kingzcourt/classes/player.dart';
import 'active_game_widget.dart';
import 'active_player_widget.dart';

Playlist playlist = Playlist();
Team team1 = Team("Team 1", 6);
Team team2 = Team("Team 2", 6);

class RefreshGameButton extends StatefulWidget {
  @override
  _RefreshGameButton createState() => _RefreshGameButton();
}

class _RefreshGameButton extends State<RefreshGameButton> {
  Widget build(BuildContext context) {
    floatingActionButton:
    FloatingActionButton(
        onPressed: () {
          Text("Button pressed");
          algorithm(team1, team2, playlist);
          //ActivePlayerWidget.setState();
          //ActiveGameWidget.setState();
          //refresh active game - update state of active game widget?
        },

        //mini: false,
        //elevation: 2, //don't know
        //clipBehavior: Clip, //not sure what to do here
        child: Icon(Icons.refresh),
        backgroundColor: Colors.green);
  }
}
