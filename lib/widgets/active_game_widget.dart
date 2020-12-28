import 'package:kingzcourt/widgets/refresh_game_button.dart';
import 'active_player_widget.dart';
import 'package:kingzcourt/classes/colors.dart';
import 'playerpageicon.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/Playlist.dart';
import 'package:flutter/material.dart';
import 'package:kingzcourt/classes/team_ihor.dart';
import 'package:kingzcourt/widgets/playericon.dart';

class ActiveGameWidget extends StatefulWidget {
  @override
  _ActiveGameWidgetState createState() => _ActiveGameWidgetState();
  Team _team1;
  Team _team2;
  final double circleLabelRadius = 24.0;
  final double dividerSize = 5.0;
  //constructor for teams that will be displayed:
  ActiveGameWidget(Team newTeam1, Team newTeam2) {
    _team1 = newTeam1;
    _team2 = newTeam2;

    // _team1 = Team('Team1', 6);
    // _team2 = Team('Team2', 6);

    // _team1.addPlayer(Player('Alex', 'Walen', 'OP', 0, null));
    // _team1.addPlayer(Player('David', 'Stanko', 'OH', 0, null));
    // _team1.addPlayer(Player("Andrew", "Varela", "DS", 0, null));
    // _team1.addPlayer(Player("Ezra", "Sackstein", "S", 0, null));
    // _team1.addPlayer(Player("Hector", "Herrada", "OH", 0, null));
    // _team1.addPlayer(Player("Bryce", "Chinn", "M", 0, null));

    // _team2.addPlayer(Player('Ihor', 'Sherstiuk', 'L', 0, null));
    // _team2.addPlayer(Player("Kat", "Outcalt", "OP", 0, null));
    // _team2.addPlayer(Player("Kainalu", "Lastname", "S", 0, null));
    // _team2.addPlayer(Player("Lokene", "Lastname", "DS", 0, null));
    // _team2.addPlayer(Player("Kiran", "Lastname", "OH", 0, null));
    // _team2.addPlayer(Player("Cole", "Lastname", "M", 0, null));
  }
}

class _ActiveGameWidgetState extends State<ActiveGameWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primaryColor, Colors.white]),
        ),
        child: Row(children: [
          //displaying the players on each team:
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  // height: MediaQuery.of(context).size.height / 2,
                  width: (MediaQuery.of(context).size.width / 2) -
                      widget.dividerSize / 2,
                  // color: Colors.amber,
                  child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 3, vertical: 15.0),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      children: [
                        //makes the number of active player widgets that correspond to the team size:
                        for (Player i in widget._team1.getPlayersOnTeam())
                          //PlayerIcon(i, isTeam: true)
                          PlayerIcon(i)
                      ])),
              Positioned(
                  top: -widget.circleLabelRadius,
                  left: (MediaQuery.of(context).size.width / 4) -
                      widget.dividerSize / 2 -
                      widget.circleLabelRadius,
                  child: CircleAvatar(
                    radius: widget.circleLabelRadius,
                    backgroundColor: Colors.white,
                    child: Text(
                      "T1",
                      style: Theme.of(context).textTheme.title,
                    ),
                  )),
            ],
          ),
          Expanded(
            child: Container(
              height:
                  100, // this container should adjust to the height of the widget
              width: widget.dividerSize,
              color: Colors.white38,
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  // height: MediaQuery.of(context).size.height / 2,
                  width: (MediaQuery.of(context).size.width / 2) - 2.5,
                  //color: Colors.lightGreen,
                  child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 3, vertical: 15.0),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      children: [
                        //makes the number of active player widgets that correspond to the team size:
                        for (Player i in widget._team2.getPlayersOnTeam())
                          //PlayerIcon(i, isTeam: false)
                          PlayerIcon(i)
                      ])),
              Positioned(
                  top: -widget.circleLabelRadius,
                  left: (MediaQuery.of(context).size.width / 4) -
                      widget.dividerSize / 2 -
                      widget.circleLabelRadius,
                  child: CircleAvatar(
                    radius: widget.circleLabelRadius,
                    backgroundColor: Colors.white,
                    child: Text(
                      "T2",
                      style: Theme.of(context).textTheme.title,
                    ),
                  )),
            ],
          ),
        ]));
  }
}
