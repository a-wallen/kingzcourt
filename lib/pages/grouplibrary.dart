import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:kingzcourt/classes/group.dart';
import 'package:kingzcourt/database/databaseHelper.dart';
import '../widgets/editgroupplayers.dart';

import 'package:kingzcourt/classes/colors.dart'; // class AppColors
import 'package:kingzcourt/utility/theme.dart';

class GroupLibraryPage extends StatefulWidget {
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
    library.forEach((group) {
      print("Group Name: ${group.getGroupName()}. ID: ${group.getId()}");
    });
    return newGroupId;
  }

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
  void initState() {
    // TODO: implement initState
    getGroupLib();
    super.initState();
  }

  String codeDialog;
  String valueText;

  @override
  Widget build(BuildContext context) {
    // MediaQueryData media = MediaQuery.of(context);
    // Since the function changes the state of the widget,
    // and the widget is Stateful,
    // the widget will call the function when it builds.
    // /Since the widget reacts to those changes,
    // and calls the function every time, it is infinite.
    // Please remove the two lines below.

    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text("Saved Groups"),
      ),
      body: ListView.builder(
          itemCount: library.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditRoute()),
                );
              },
              title: Text('${library[index].getGroupName()}'),
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
                            color: Colors.red,
                            textColor: Colors.white,
                            child: Text('CANCEL'),
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                          ),
                          new FlatButton(
                              color: Colors.green,
                              textColor: Colors.white,
                              child: new Text('ADD'),
                              onPressed: () {
                                setState(() {
                                  codeDialog = valueText;
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
