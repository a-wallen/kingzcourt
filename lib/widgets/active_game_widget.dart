import 'package:kingzcourt/widgets/refresh_game_button.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/Playlist.dart';
import 'package:flutter/material.dart';
import 'package:kingzcourt/classes/team_ihor.dart';
import 'package:kingzcourt/algorithms/matching_algo_ihor.dart';
import 'package:kingzcourt/widgets/playericon.dart';

class ActiveGameWidget extends StatefulWidget {
  @override
  _ActiveGameWidgetState createState() => _ActiveGameWidgetState();
  Team _team1;
  Team _team2;
  List<Team> _state = [Team('Team 1', 6), Team('Team 2', 6)];

  //constructor for teams that will be displayed:
  ActiveGameWidget(Team newTeam1, Team newTeam2) {
    // _team1 = newTeam1;
    // _team2 = newTeam2;

    _team1 = Team('Team1', 6);
    _team2 = Team('Team2', 6);

    _team1.addPlayer(Player('Alex', 'Walen', 'OP', 0, null));
    _team1.addPlayer(Player('David', 'Stanko', 'OH', 0, null));
    _team1.addPlayer(Player("Andrew", "Varela", "DS", 0, null));
    _team1.addPlayer(Player("Ezra", "Sackstein", "S", 0, null));
    _team1.addPlayer(Player("Hector", "Herrada", "OH", 0, null));
    _team1.addPlayer(Player("Bryce", "Chinn", "M", 0, null));

    _team2.addPlayer(Player('Ihor', 'Sherstiuk', 'L', 0, null));
    _team2.addPlayer(Player("Kat", "Outcalt", "OP", 0, null));
    _team2.addPlayer(Player("Kainalu", "Lastname", "S", 0, null));
    _team2.addPlayer(Player("Lokene", "Lastname", "DS", 0, null));
    _team2.addPlayer(Player("Kiran", "Lastname", "OH", 0, null));
    _team2.addPlayer(Player("Cole", "Lastname", "M", 0, null));
  }

  // makeNewGame(Team team1, Team team2, Playlist playlist) {
  //   algorithm(team1, team2, playlist);
  //   setState() {
  //     _state = [team1, team2];
  //   }

  //   ;
  // }
}

class _ActiveGameWidgetState extends State<ActiveGameWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 410,
        height: 300,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red[500],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Wrap(//alignment: WrapAlignment.spaceBetween,
            children: [
          //displaying the players on each team:

          Container(
              height: 300,
              width: 190,
              //color: Colors.amber,
              child: GridView.count(
                  padding: EdgeInsets.only(left: 3),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  children: [
                    //makes the number of active player widgets that correspond to the team size:
                    for (Player i in widget._team1.getPlayersOnTeam())
                      PlayerIcon(i)
                  ])),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                  width: 5,
                  height: 298,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(''))),
          Container(
              height: 300,
              width: 190,
              //color: Colors.lightGreen,
              child: GridView.count(
                  padding: EdgeInsets.only(right: 3),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  children: [
                    //makes the number of active player widgets that correspond to the team size:
                    for (Player i in widget._team2.getPlayersOnTeam())
                      PlayerIcon(i)
                  ])),
        ]));
  }
}
