import 'package:flutter/material.dart';
import 'package:kingzcourt/utility/theme.dart';
import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/classes/group.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/widgets/playerpageicon.dart';
import 'package:kingzcourt/database/databaseHelper.dart';

class GroupInspector extends StatefulWidget {
  Group myGroup;
  GroupInspector(Group g) {
    this.myGroup = g;
  }
  @override
  _GroupInspectorState createState() => _GroupInspectorState();
}

class _GroupInspectorState extends State<GroupInspector> {
  final bRad = 45.0; // I'M SORRY I COULDN'T GET RADIUS FROM THEME.DART
  List<Player> group;

  void getPlayersInGroup() async {
    DatabaseHelper.instance
        .getGroupsPlayers(widget.myGroup)
        .then((players) => group = players);
  }

  @override
  void initState() {
    group = [];
    getPlayersInGroup();
    print(group);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text(widget.myGroup.getGroupName()),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20.0),
        itemCount: group.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 7.0,
          mainAxisSpacing: 20.0,
        ),
        itemBuilder: (context, index) {
          return PlayerPageIcon(group[index]);
        },
      ),
    );
  }
}
