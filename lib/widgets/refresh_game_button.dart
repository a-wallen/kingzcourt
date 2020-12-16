import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingzcourt/algorithms/matching_algo_ihor.dart';
import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/team_ihor.dart';
import 'package:kingzcourt/classes/player.dart';
import 'active_game_widget.dart';
import 'active_player_widget.dart';

class RefreshGameButton extends StatefulWidget {
  @override
  _RefreshGameButton createState() => _RefreshGameButton();
}

class _RefreshGameButton extends State<RefreshGameButton> {
  Widget build(BuildContext context) {
    /*Playlist playlist = Playlist();
    Team team1;
    Team team2;*/

    return FloatingActionButton(
        onPressed: () {
          Playlist playlist = Playlist();
          Team team1;
          Team team2;
          //the following gives an error - "the getter teamSize was called on null"
          //ActiveGameWidget(team1, team2).makeNewGame(team1, team2, playlist);
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.green);
  }
}
