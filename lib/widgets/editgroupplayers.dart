import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../classes/player.dart';
import 'package:kingzcourt/classes/group.dart';
import 'package:kingzcourt/database/databaseHelper.dart';

import 'package:kingzcourt/classes/colors.dart'; // class AppColors
import 'package:kingzcourt/utility/theme.dart';

/*
// Get all players in group by group id
  Future<List<Player>> getGroupsPlayers(int id) async {
    List<Player> groupPlayers = [];
    Database db = await instance.database;
    List<Map<String, dynamic>> group = await getGroupRows(db, id);
    group.forEach((entry) {
      groupPlayers.add(Player.fromMap(entry));
    });
    return groupPlayers;
  }
*/
// TODO: add players for each team
class EditRoute extends StatefulWidget {
  @override
  _EditRouteState createState() => _EditRouteState();
}

class _EditRouteState extends State<EditRoute> {
  final bRad = 45.0; // I'M SORRY I COULDN'T GET RADIUS FROM THEME.DART
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          textTheme: Theme.of(context).textTheme,
          title: Text("Group Players"),
        ),
        body: Center(
            child: CircleAvatar(
                child: Text("Player name"),
                backgroundColor: AppColors.primaryDarkColor,
                foregroundColor: AppColors.primaryAccent,
                radius: bRad)),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.primaryDarkColor,
            child: Icon(Icons.edit)));
  }
}
/*
  List<Player> groupPlayers = [];

  void getGroupPlayers() {
    DatabaseHelper.instance.getGroupsPlayers(groupId).then((result) {
      setState(() {
        groupPlayers = result;
      });
    });
  }
  */
