import 'package:flutter/material.dart';

import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/intermediate.dart';
import 'package:kingzcourt/classes/group.dart';
import 'package:kingzcourt/database/databaseHelper.dart';

class DatabaseTestPage extends StatefulWidget {
  @override
  _DatabaseTestPageState createState() => _DatabaseTestPageState();
}

class _DatabaseTestPageState extends State<DatabaseTestPage> {
  void printPlayerLibrary(List<Player> lib) {
    print("Printing Player Library");
    lib.forEach((player) {
      print(player.toString());
    });
    print("");
  }

  void printGroupLibrary(List<Group> lib) {
    print("Print Group Library");
    lib.forEach((group) {
      print(group.toString());
    });
    print("");
  }

  void printIntermediateTable(List<Intermediate> lib) {
    print("Print Group Library");
    lib.forEach((inter) {
      print(inter.toString());
    });
    print("");
  }

  void testPlayerTable() async {
    List<Player> library = [];
    Player alex = Player("Alex", "Wallen", "OH", 0, "path/path");
    Player hector = Player("Hector", "Herrada", "OP", 0, "path/path");
    int pid = await DatabaseHelper.instance.insertPlayer(alex);
    library = await DatabaseHelper.instance.getPlayerLibrary();
    printPlayerLibrary(library);
    alex.setId(pid);
    DatabaseHelper.instance.updatePlayer(alex, hector);
    library = await DatabaseHelper.instance.getPlayerLibrary();
    printPlayerLibrary(library);
    DatabaseHelper.instance.removePlayer(hector);
    library = await DatabaseHelper.instance.getPlayerLibrary();
    printPlayerLibrary(library);
  }

  void testGroupTable() async {
    List<Group> library = [];
    Group g1 = Group("Group 1");
    Group g2 = Group("Group 2");
    int pid = await DatabaseHelper.instance.insertGroup(g1);
    library = await DatabaseHelper.instance.getGroupLibrary();
    printGroupLibrary(library);
    g1.setId(pid);
    DatabaseHelper.instance.updateGroup(g1, g2);
    library = await DatabaseHelper.instance.getGroupLibrary();
    printGroupLibrary(library);
    DatabaseHelper.instance.removeGroup(g2);
    library = await DatabaseHelper.instance.getGroupLibrary();
    printGroupLibrary(library);
  }

  void testIntermediateTable() async {
    List<Intermediate> lib = [];
    Intermediate i1 = Intermediate(1, 1);
    Intermediate i2 = Intermediate(2, 1);
    DatabaseHelper.instance.insertIntermediate(i1);
    printIntermediateTable(lib);
    DatabaseHelper.instance.removeIntermediate(i1);
    printIntermediateTable(lib);
    DatabaseHelper.instance.insertIntermediate(i2);
    printIntermediateTable(lib);
    DatabaseHelper.instance.removeIntermediate(i2);
    printIntermediateTable(lib);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text(
              "Test Player Table",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () => testPlayerTable(),
          ),
          RaisedButton(
            child: Text(
              "Test Group Table",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
            onPressed: () => testGroupTable(),
          ),
          RaisedButton(
            child: Text(
              "Test Intermediate Table",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () => testIntermediateTable(),
          ),
        ],
      ),
    ));
  }
}
