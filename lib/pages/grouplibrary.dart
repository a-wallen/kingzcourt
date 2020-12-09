import 'dart:io';
import 'package:flutter/material.dart';

import 'package:kingzcourt/classes/group.dart';
import 'package:kingzcourt/database/databaseHelper.dart';

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

  void getGroupLib() async {
    library = await DatabaseHelper.instance.getGroupLibrary();
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

  @override
  Widget build(BuildContext context) {
    // MediaQueryData media = MediaQuery.of(context);
    _insertNames();
    getGroupLib();
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text("Saved Groups"),
      ),
      body: ListView.builder(
          itemCount: library.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  '${library[index].getGroupName()}'), // same syntax as flutter.dev
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addGroup(Group("Sand squad"));
            updateGroupData(library[0], Group("Updated"));
            removeGroupByID(library[3]);
          },
          child: Icon(Icons.add),
          backgroundColor: AppColors.primaryDarkColor),
    );
  }

  // test function to build database
  void _insertNames() {
    List<String> names = ["Sudden Impact", "Kent Juniors", "Puget Sound"];
    names.forEach((string) {
      Group group = Group(string);
      this.addGroup(group);
    });
  }
}

// prev code:
/*
body: Container(
        child: Column(
          children: [
            Text(
              "$test",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //TestWidget(),
          ],
        ),
      ),
*/
