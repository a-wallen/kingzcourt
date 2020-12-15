import 'playerpageicon.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/Playlist.dart';
import 'package:flutter/material.dart';
import 'package:kingzcourt/classes/team_ihor.dart';

Player player = Player("Default", "Lastname", "Position", -1, "path/path");
Playlist playlist = Playlist();
Team team1 = Team("Team 1", 6);
Team team2 = Team("Team 2", 6);

class ActiveGameWidget extends StatefulWidget {
  @override
  _ActiveGameWidgetState createState() => _ActiveGameWidgetState();
}

class _ActiveGameWidgetState extends State<ActiveGameWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        color: Colors.amber,
        child: GridView.count(
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: 2,
            children: [
              Text('Team 1'),
              Text('Team 2'),
              PlayerPageIcon(player),
              PlayerPageIcon(player),
              Container(height: 10, child: Text('Player 1')),
              Container(height: 10, child: Text('Player 2')),
              Container(height: 10, child: Text('Player 3')),
              Container(height: 10, child: Text('Player 4')),
              Container(height: 10, child: Text('Player 5')),
              Container(height: 10, child: Text('Player 6')),
              Container(height: 10, child: Text('Player 7')),
              Container(height: 10, child: Text('Player 8')),
            ]));
  }
  /*Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          top: 0,
          left: 50,
          child: Column(children: [
            Text('Team 1'),
            Row(
              children: [
                Text('Player 1'),
                Text('Player 2'),
                //PlayerPageIcon(player)
              ],
              /*Row(children: [
            Text('Player 3'),
            Text('Player 4')
          ])*/
            )
          ])),
      /*Positioned(
          left: 100,
          //right: 100,
          child:*/
      /*VerticalDivider(
          width: 10,
          thickness: 20,
          endIndent: 0,
          indent: 0,
          color: Colors.black),*/
      Positioned(
          top: 0,
          right: 50,
          child: Column(children: [
            Row(children: [Text('Team 2')])
          ]))
    ]);
  }*/
}
