import 'package:flutter/material.dart';

import 'package:kingzcourt/classes/group.dart';
import 'package:kingzcourt/database/databaseHelper.dart';
import 'package:kingzcourt/database/getGroupLibrary.dart';
import 'package:kingzcourt/widgets/drawer.dart';

class GroupLibraryPage extends StatefulWidget {
  @override
  _GroupLibraryPageState createState() => _GroupLibraryPageState();
}

class _GroupLibraryPageState extends State<GroupLibraryPage> {
  List<Group> library = [];
  // add player to database
  void addGroup(Group g) async {
    DatabaseHelper.instance.insertGroup(g);
    getGroupLib();
  }

  void getGroupLib() async {
    library = await DatabaseHelper.instance.getGroupLibrary();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getGroupLib();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text("Saved Groups"),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => addGroup(Group("BeachVB"))),
    );
  }
}
