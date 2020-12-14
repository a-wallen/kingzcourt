import 'playerpageicon.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/Playlist.dart';
import 'package:flutter/material.dart';

Player player = Player("Default", "Lastname", "Position", -1, "path/path");
Playlist playlist = Playlist();

class ActiveGameWidget extends StatefulWidget {
  @override
  _ActiveGameWidgetState createState() => _ActiveGameWidgetState();
}

class _ActiveGameWidgetState extends State<ActiveGameWidget> {
  @override
  Widget build(BuildContext context) {
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
  }
}
