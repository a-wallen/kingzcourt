import 'package:flutter/material.dart';

import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/utility/theme.dart';
import 'package:kingzcourt/widgets/drawer.dart';
import '../database/databaseHelper.dart';
import '../classes/player.dart';
import '../widgets/playerfloatingbuttons.dart';
import '../widgets/playerpageicon.dart';

class PlayerLibraryPage extends StatefulWidget {
  _PlayerLibraryPageState of(BuildContext c) {
    return c.findAncestorStateOfType<_PlayerLibraryPageState>();
  }

  @override
  _PlayerLibraryPageState createState() => _PlayerLibraryPageState();
}

class _PlayerLibraryPageState extends State<PlayerLibraryPage> {
  List<Player> library = [];
  bool deleteModeOn = false;
  List<Player> deleteList = [];

  _PlayerLibraryPageState() { deleteModeOn = false; }

  // refresh player library or get it for the first time
  void getPlayerLibrary() async {
    DatabaseHelper.instance.getPlayerLibrary().then((result) {
      setState(() {
        library = result;
      });
    });
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
    // library.add(null);
  }

  @override
  Widget build(BuildContext context) {
    // setState(() { deleteModeOn = false; });
    return Scaffold(
      appBar: AppBar(
          textTheme: Theme.of(context).textTheme,
          title: (Text("Saved Players"))),
      floatingActionButton: PlayerFloatingButtons(),
      body: GridView.builder(
        padding: EdgeInsets.all(20.0),
        itemCount: library.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 7.0,
          mainAxisSpacing: 20.0,
        ),
        itemBuilder: (context, index) {
            return PlayerPageIcon(index, library[index]);
        },
      ),
    );
  }

  Widget deleteSnackBar(context) {
    return BottomSheet(
        onClosing: () { print("HIIIIIIIIIII"); },
        builder: (context) {
          return Container(
            color: AppColors.accentColor,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Text("Delete Players"),
                // Expanded(child: Container()),
                FlatButton(
                    onPressed: () {
                      this.setState(() {
                        deleteModeOn = false;
                        deleteList.clear();
                      });
                      Navigator.pop(context);
                    },
                    child: Text("cancel",
                      style: TextStyle(color: AppColors.primaryColor, fontFamily: Theme.of(context).textTheme.headline1.fontFamily),
                      textScaleFactor: 1.5,
                    )
                ),
                FlatButton(
                    onPressed: () {
                      this.setState(() {
                        deleteModeOn = false;
                        for (Player p in deleteList) {
                          removePlayerByID(p);
                        }
                      });
                      Navigator.pop(context);
                    },
                    child: Text("delete",
                      style: TextStyle(color: AppColors.primaryAccentDark, fontFamily: Theme.of(context).textTheme.headline1.fontFamily),
                      textScaleFactor: 1.5,
                    )
                ),
              ],
            ),
          );
        },
    );
  }
}