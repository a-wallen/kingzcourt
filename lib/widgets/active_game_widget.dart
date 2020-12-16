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
  Team _team1;
  Team _team2;
  List<Team> _state = [Team('Team 1', 6), Team('Team 2', 6)];

  //constructor for teams that will be displayed:
  ActiveGameWidget(Team newTeam1, Team newTeam2) {
    _team1 = newTeam1;
    _team2 = newTeam2;
  }

  makeNewGame(Team team1, Team team2, Playlist playlist) {
    algorithm(team1, team2, playlist);
    setState() {
      _state = [team1, team2];
    }

    ;
  }
}

class _ActiveGameWidgetState extends State<ActiveGameWidget> {
  @override

  //was trying to set the state by setting the teams that are playing, got some errors
  /*List<Team> _state = [Team('Team 1', 6), Team('Team 2', 6)];

  makeNewGame(Team team1, Team team2, Playlist playlist) {
    algorithm(team1, team2, playlist);
    setState() {
      _state = [team1, team2];
    }

    ;
  }*/

  Widget build(BuildContext context) {
    Team team1 = Team("Team 1", 6);
    Team team2 = Team("Team 2", 3);
    int team1Size = team1.teamSize;
    int team2Size = team2.teamSize;
    Player player = Player("Alex", "Wallen", "OH", 0, "path/path");

    return Stack(children: [
      //displaying the players on each team:
      //Text('Team 1'),
      Container(
          height: 350,
          width: 179,
          color: Colors.amber,
          child: GridView.count(
              padding: EdgeInsets.all(22),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
              children: [
                //makes the number of active player widgets that correspond to the team size:
                for (int i = 0; i < (team1Size); i++) ActivePlayerWidget()
              ])),
      //Positioning the other container to the right so that the two don't overlap:
      Positioned(
        right: 0,
        child: Container(
            height: 350,
            width: 179,
            color: Colors.lightGreen,
            child: GridView.count(
                padding: EdgeInsets.all(22),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                children: [
                  //makes the number of active player widgets that correspond to the team size:
                  for (int i = 0; i < (team2Size); i++) ActivePlayerWidget()
                ])),
      ),

      //divider won't show up
      /*VerticalDivider(
          color: Colors.black, thickness: 10, indent: 0, endIndent: 0),*/

      //headings of "Team 1" and "Team 2"
      Row(children: [
        //it's only necessary to expand one of them to fill the available space
        Expanded(child: Text('       Team 1')),
        Text('Team 2        ')
      ])
    ]);
  }
}
