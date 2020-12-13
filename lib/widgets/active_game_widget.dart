import 'playerpageicon.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:flutter/material.dart';

Player player = Player("Default", "Lastname", "Position", -1, "path/path");

class ActiveGameWidget extends StatefulWidget {
  @override
  _ActiveGameWidgetState createState() => _ActiveGameWidgetState();
}

class _ActiveGameWidgetState extends State<ActiveGameWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        //Align(alignment: Alignment.topLeft,
        children: [
          Row(children: [Text('Team 1'), Text('Testing')]),
        ],
      ),

      Column(children: [Text('Team 2')])
      //)
    ]);
    //Center(child: Text(player.getFirstName()))]);
  }
}
