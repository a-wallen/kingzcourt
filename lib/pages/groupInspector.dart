import 'package:flutter/material.dart';
import 'package:kingzcourt/utility/theme.dart';
import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/classes/group.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/intermediate.dart';
import 'package:kingzcourt/widgets/playericon.dart';
import 'package:kingzcourt/database/databaseHelper.dart';

class GroupInspector extends StatefulWidget {
  Group myGroup;
  GroupInspector(Group g) {
    this.myGroup = g;
    print("g: ${g.getPlayerList()}");
  }
  @override
  _GroupInspectorState createState() => _GroupInspectorState();
}

class _GroupInspectorState extends State<GroupInspector> {
  final bRad = 45.0; // I'M SORRY I COULDN'T GET RADIUS FROM THEME.DART
  List<Player> group;
  List<Player> library = [];
  List<int> selectedIndexes = [];

  void getPlayersInGroup() async {
    DatabaseHelper.instance.getGroupsPlayers(widget.myGroup).then((players) {
      setState(() {
        group = players;
      });
    });
  }

  void getPlayerLibrary() async {
    DatabaseHelper.instance.getPlayerLibrary().then((result) {
      setState(() {
        library = result;
      });
    });
  }

  @override
  void initState() {
    group = [];
    getPlayersInGroup();
    getPlayerLibrary();
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
                  return PlayerIcon(group[index]);
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                      builder: (context, setState) => AlertDialog(
                            title: Text("add player"),
                            content: Container(
                                height: 360.0,
                                width: 240.0,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: library.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      print("group: ${group.length}");
                                      return ListTile(
                                        onTap: () {
                                          if (selectedIndexes.contains(index)) {
                                            setState(() {
                                              selectedIndexes.remove(index);
                                            });
                                          } else {
                                            setState(() {
                                              selectedIndexes.add(index);
                                            });
                                          }
                                          print(selectedIndexes);
                                        },
                                        leading: Icon(Icons.person),
                                        trailing: selectedIndexes
                                                .contains(index)
                                            ? Icon(Icons.check_box,
                                                color: AppColors.primaryColor)
                                            : Icon(
                                                Icons.check_box_outline_blank),
                                        title:
                                            Text(library[index].getFirstName()),
                                      );
                                    })),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("add players"),
                                color: AppColors.primaryColor,
                                textColor: Colors.white,
                                onPressed: () {
                                  List<Player> temp = [];
                                  selectedIndexes.forEach((i) {
                                    temp.add(library[i]);
                                  });
                                  temp.forEach((player) {
                                    DatabaseHelper.instance.insertIntermediate(
                                        Intermediate(player.getId(),
                                            widget.myGroup.getId()));
                                  });
                                  getPlayersInGroup();
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ));
                });
          }, // navigate to player library
          child: Icon(Icons.edit),
          backgroundColor: AppColors.primaryDarkColor,
        ),
        );
  }
}
