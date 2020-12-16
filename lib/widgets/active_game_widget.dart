import 'package:kingzcourt/widgets/refresh_game_button.dart';
import 'active_player_widget.dart';
import 'playerpageicon.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/Playlist.dart';
import 'package:flutter/material.dart';
import 'package:kingzcourt/classes/team_ihor.dart';
import 'package:kingzcourt/algorithms/matching_algo_ihor.dart';

class ActiveGameWidget extends StatefulWidget {
  @override
  _ActiveGameWidgetState createState() => _ActiveGameWidgetState();
  Team team1;
  Team team2;

  //constructor for teams that will be displayed:
  ActiveGameWidget(Team newTeam1, Team newTeam2) {
    team1 = newTeam1;
    team2 = newTeam2;
  }
}

class _ActiveGameWidgetState extends State<ActiveGameWidget> {
  @override
  /*Team team1 = Team('Team 1', 6);
  Team team2 = Team('Team 2', 6);
  var _state = [team1, team2];

  makeNewGame(Team team1, Team team2, Playlist playlist) {
    algorithm(team1, team2, playlist);
    setState() {
      _state = [team1, team2];
    }

    ;
  }*/

  Widget build(BuildContext context) {
    return Stack(children: [
      //displaying the players on each team:
      Container(
          height: 350,
          color: Colors.amber,
          child: GridView.count(
              padding: EdgeInsets.all(22),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              scrollDirection: Axis.vertical,
              children: [
                ActivePlayerWidget(),
                ActivePlayerWidget(),
                ActivePlayerWidget(),
                ActivePlayerWidget(),
                ActivePlayerWidget(),
                ActivePlayerWidget(),
                ActivePlayerWidget(),
                ActivePlayerWidget(),
                ActivePlayerWidget(),
                ActivePlayerWidget(),
                ActivePlayerWidget(),
                ActivePlayerWidget(),
                ActivePlayerWidget(),
              ])),

      //divider won't show up
      VerticalDivider(
          color: Colors.black, thickness: 10, indent: 0, endIndent: 0),

      //headings of "Team 1" and "Team 2"
      Container(
          height: 18,
          color: Colors.lightBlue,
          child: Row(children: [
            Expanded(
                child: Align(
                    child: Text('       Team 1'),
                    alignment: Alignment.topLeft)),
            Expanded(
                child: Align(
                    child: Text('Team 2      '), alignment: Alignment.topRight))
          ])),
    ]);
  }
}
