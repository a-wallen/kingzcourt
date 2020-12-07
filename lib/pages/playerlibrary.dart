import 'package:flutter/material.dart';

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
  void addPlayer(Player p) async {
    await DatabaseHelper.instance.insertPlayer(p);
    library = await DatabaseHelper.instance.getPlayerLibrary();
    library.forEach((player) {
      print(player.toString());
    });
  }

  void updatePlayerData(Player originalData, Player newData) async {
    await DatabaseHelper.instance.updatePlayer(originalData, newData);
    getPlayerLibrary();
    library.forEach((player) {
      print(player.toString());
    });
  }

  void removePlayerByID(Player p) async {
    await DatabaseHelper.instance.removePlayer(p);
    getPlayerLibrary();
    library.forEach((player) {
      print(player.toString());
    });
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
        title: Text("Saved Players"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addPlayer(Player("Alex", "Wallen", "OH", 0, "path/path"));
          updatePlayerData(
              library[3], Player("Hector", "Herrada", "OH", 0, "path/path"));
          removePlayerByID(library[1]);
        },
      ),
    );
  }
}
