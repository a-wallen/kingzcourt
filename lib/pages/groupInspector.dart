import 'package:flutter/material.dart';
import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/classes/group.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/intermediate.dart';
import 'package:kingzcourt/widgets/groupinspectorpageicon.dart';
import 'package:kingzcourt/database/databaseHelper.dart';
import '../widgets/GIfloatingbuttons.dart';

class GroupInspector extends StatefulWidget {
  Group myGroup;
  GroupInspector(Group g) {
    this.myGroup = g;
  }

  static _GroupInspectorState of(BuildContext c) {
    return c.findAncestorStateOfType<_GroupInspectorState>();
  }

  @override
  _GroupInspectorState createState() => _GroupInspectorState();
}

class _GroupInspectorState extends State<GroupInspector> {
  final bRad = 45.0; // I'M SORRY I COULDN'T GET RADIUS FROM THEME.DART
  List<Player> group;
  List<Player> library = [];
  List<int> selectedIndexes = [];
  bool deleteModeOn = false;
  List<Player> deleteList = [];

  _GroupInspectorState() {
    deleteModeOn = false;
  }

  void getPlayersInGroup() async {
    DatabaseHelper.instance.getGroupsPlayers(widget.myGroup).then((players) {
      setState(() {
        group = players;
      });
    });
  }

  void getPlayerLibrary() async {
    DatabaseHelper.instance.getPlayerLibrary().then((result) {
      for (Player p in group) result.remove(p);
      setState(() {
        library = result;
      });
    });
  }

  Future<int> removePlayerFromGroup(Player p, Group g) async {
    int result = await DatabaseHelper.instance.removeIntermediate(Intermediate(p.getId(), g.getId()));
    getPlayerLibrary();
    return result;
  }

  @override
  void initState() {
    group = [];
    deleteModeOn = false;
    getPlayersInGroup();
    getPlayerLibrary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          textTheme: Theme.of(context).textTheme,
          title: Text(widget.myGroup.getGroupName()),
        ),
        body: group.isEmpty
            ? Center(
                child: Text(
                  "add players to this group",
                  style: TextStyle(
                    color: AppColors.primaryDarkColor,
                    fontWeight:
                        Theme.of(context).textTheme.bodyText1.fontWeight,
                    fontFamily:
                        Theme.of(context).textTheme.bodyText1.fontFamily,
                    fontSize: Theme.of(context).textTheme.headline6.fontSize,
                  ),
                ),
              )
            : GridView.builder(
                padding: EdgeInsets.all(20.0),
                itemCount: group.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 7.0,
                  mainAxisSpacing: 20.0,
                ),
                itemBuilder: (context, index) {
                  return GroupInspIcon(group[index]);
                },
              ),
        floatingActionButton: GI_FloatingButtons(),
        );
  }

  Widget deleteSnackBar(context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          color: AppColors.accentColor,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Text("Delete Players"),
              // Expanded(child: Container()),
              FlatButton(
                  onPressed: () {
                    this.setState(() {
                      deleteModeOn = false;
                      deleteList.clear();
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "cancel",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontFamily:
                        Theme.of(context).textTheme.headline1.fontFamily),
                    textScaleFactor: 1.5,
                  )),
              FlatButton(
                  onPressed: () {
                    this.setState(() {
                      deleteModeOn = false;
                      for (Player p in deleteList) {
                        removePlayerFromGroup(p, widget.myGroup);
                      }
                      deleteList.clear();
                    });
                    getPlayersInGroup();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "delete",
                    style: TextStyle(
                        color: AppColors.primaryAccentDark,
                        fontFamily:
                        Theme.of(context).textTheme.headline1.fontFamily),
                    textScaleFactor: 1.5,
                  )),
            ],
          ),
        );
      },
    );
  }
}
