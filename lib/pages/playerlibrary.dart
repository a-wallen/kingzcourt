import 'package:flutter/material.dart';

import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/utility/theme.dart';
import 'package:kingzcourt/widgets/drawer.dart';
import '../database/databaseHelper.dart';
import '../classes/player.dart';

class PlayerLibraryPage extends StatefulWidget {
  @override
  _PlayerLibraryPageState createState() => _PlayerLibraryPageState();
}

class _PlayerLibraryPageState extends State<PlayerLibraryPage> {
  List<Player> library = [];

  // refresh player library or get it for the first time
  void getPlayerLibrary() async {
    library = await DatabaseHelper.instance.getPlayerLibrary();
  }

  // add player to database
  Future<int> addPlayer(Player p) async {
    int newPlayerId = await DatabaseHelper.instance.insertPlayer(p);
    getPlayerLibrary();
    return newPlayerId;
  }

  Future<int> updatePlayerData(Player originalData, Player newData) async {
    int result =
        await DatabaseHelper.instance.updatePlayer(originalData, newData);
    getPlayerLibrary();
    return result;
  }

  Future<int> removePlayerByID(Player p) async {
    int result = await DatabaseHelper.instance.removePlayer(p);
    getPlayerLibrary();
    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    getPlayerLibrary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          textTheme: Theme.of(context).textTheme,
          title: (Text("Saved Players"))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // testing
          // addPlayer(Player("Alex", "Wallen", "OH", 0, "path/path"));
          // updatePlayerData(
          //     library[9], Player("Hector", "Herrada", "OH", 0, "path/path"));
          // removePlayerByID(library[1]);
        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.primaryDarkColor,
      ),
    );
  }
}
