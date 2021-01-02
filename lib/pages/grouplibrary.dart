import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:kingzcourt/classes/group.dart';
import 'package:kingzcourt/database/databaseHelper.dart';
import 'groupInspector.dart';

import 'package:kingzcourt/classes/colors.dart'; // class AppColors
import 'package:kingzcourt/pages/landing.dart';

class GroupLibraryPage extends StatefulWidget {
  bool addGroup;
  GroupLibraryPage(bool isOn) {
    this.addGroup = isOn;
  }
  _GroupLibraryPageState of(BuildContext c) {
    return c.findAncestorStateOfType<_GroupLibraryPageState>();
  }

  @override
  _GroupLibraryPageState createState() => _GroupLibraryPageState();
}

class _GroupLibraryPageState extends State<GroupLibraryPage> {
  int test = 1;
  List<Group> library = [];
  // add player to database
  void getGroupLib() {
    DatabaseHelper.instance.getGroupLibrary().then((result) {
      setState(() {
        library = result;
      });
    });
  }

  Future<int> addGroup(Group g) async {
    int newGroupId = await DatabaseHelper.instance.insertGroup(g);
    getGroupLib();
    return newGroupId;
  }

  // TODO: Implement UI Features to call this function
  Future<int> updateGroupData(Group originalGroup, Group newGroup) async {
    int result =
        await DatabaseHelper.instance.updateGroup(originalGroup, newGroup);
    getGroupLib();
    return result;
  }

  Future<int> removeGroupByID(Group g) async {
    int result = await DatabaseHelper.instance.removeGroup(g);
    getGroupLib();
    return result;
  }

  @override
  // TODO: implement initState
  void initState() {
    getGroupLib();
    super.initState();
  }

  String codeDialog;
  String valueText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text("Saved Groups"),
      ),
      body: ListView.separated(
          itemCount: library.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: Theme.of(context).cardTheme.elevation,
                child: ListTile(
                  onTap: () async {
                    if (widget.addGroup == true) {
                      LandingPage.playlist.addAll(await DatabaseHelper.instance
                          .getGroupsPlayers(library[index]));
                      Navigator.pop(context);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GroupInspector(library[index])),
                      ).then((value) => getGroupLib());
                    }
                  },
                  leading: Text('${library[index].getGroupName()}',
                      style: TextStyle(
                        color: AppColors.primaryDarkColor,
                        fontWeight:
                            Theme.of(context).textTheme.bodyText1.fontWeight,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText1.fontFamily,
                        fontSize:
                            Theme.of(context).textTheme.headline6.fontSize,
                      )),
                  title: Text(
                    'total: ${library[index].getNumPlayers()}',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: AppColors.primaryDarkColor),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        // deletes group
                        removeGroupByID(library[index]);
                      },
                      icon: Icon(Icons.delete)),
                ));
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 10.0,
              color: AppColors.primaryAccentDark,
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            /*addGroup(Group("Sand squad"));
            updateGroupData(library[0], Group("Updated"));
            removeGroupByID(library[3]);*/
            showDialog(
                context: context,
                builder: (context) => new AlertDialog(
                        title: Text("Group Names"),
                        content: TextField(
                          onChanged: (value) {
                            setState(() {
                              valueText = value;
                            });
                          },
                          decoration: InputDecoration(hintText: "Enter Name"),
                        ),
                        actions: <Widget>[
                          new FlatButton(
                            color: AppColors.primaryDarkColor,
                            textColor: AppColors.primaryAccent,
                            child: Text('CANCEL'),
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                          ),
                          new FlatButton(
                              color: AppColors.primaryColor,
                              textColor: AppColors.primaryAccent,
                              child: new Text('ADD'),
                              onPressed: () {
                                setState(() {
                                  codeDialog = valueText;
                                  addGroup(Group(codeDialog));
                                });
                                Navigator.of(context).pop();
                              })
                        ]));
          },
          child: Icon(Icons.add),
          backgroundColor: AppColors.primaryDarkColor),
    );
  }
}
