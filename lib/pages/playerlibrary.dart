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
    print("start getplayerlibrary");
    library = await DatabaseHelper.instance.getPlayerLibrary();
    print("end getplayerlibrary");
    print(library.length);
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
    print("start init");
    getPlayerLibrary();
    super.initState();
    // library.add(null);
    print("end init");
    print(library.length);
  }

  @override
  Widget build(BuildContext context) {
    print("start build");
    print(library.length);
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
        child: Icon(Icons.edit),
        backgroundColor: AppColors.primaryDarkColor,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20.0),
        itemCount: library.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 7.0,
          mainAxisSpacing: 20.0,
        ),
        itemBuilder: (context, index) {
          print("build single gridview element");
          print(library.length);
          if (index < library.length - 1) {
            return Card(
              child: Text("$index", textAlign: TextAlign.right,),
              elevation: 3.0,
              shape: CircleBorder(),
            );
          }
          else {
            return Card(
              child: IconButton(
                icon: Icon(Icons.add),
                iconSize: 25.0,
                color: AppColors.accentColor,
                splashColor: AppColors.accentColor,
                onPressed: () {
                  /*setState(() {library.add(null);});*/ print(library.length);
                },
              ),
              elevation: 3.0,
              shape: CircleBorder(),
            );
          }
        },
      ),
    );
  }
}
