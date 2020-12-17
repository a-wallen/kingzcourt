import 'package:flutter/material.dart';
import 'package:kingzcourt/utility/theme.dart';
import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/classes/group.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/intermediate.dart';
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
  List<Player> library = [];
  List<int> selectedIndexes = [];

  void getPlayersInGroup() async {
    DatabaseHelper.instance
        .getGroupsPlayers(widget.myGroup)
        .then((players) => group = players);
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
                                  print(selectedIndexes);
                                  List<Player> temp = [];
                                  selectedIndexes.forEach((i) {
                                    temp.add(library[i]);
                                  });
                                  temp.forEach((player) {
                                    DatabaseHelper.instance.insertIntermediate(
                                        Intermediate(player.getId(),
                                            widget.myGroup.getId()));
                                  });
                                },
                              ),
                            ],
                          ));
                });
          }, // navigate to player library
          child: Icon(Icons.edit),
          backgroundColor: AppColors.primaryDarkColor,
        ));
  }
}
