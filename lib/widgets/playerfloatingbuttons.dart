import 'package:flutter/material.dart';

import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/utility/theme.dart';
import 'package:kingzcourt/widgets/drawer.dart';
import '../database/databaseHelper.dart';
import '../classes/player.dart';
import '../pages/playerlibrary.dart';

class PlayerFloatingButtons extends StatefulWidget {
  @override
  _PlayerFloatingButtonsState createState() => _PlayerFloatingButtonsState();
}

class _PlayerFloatingButtonsState extends State<PlayerFloatingButtons> {
  @override
  Widget build(BuildContext context) {
    var state = PlayerLibraryPage().of(context);
    return Builder(
        builder: (context) => Visibility(
          visible: !state.deleteModeOn,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    // ADD PLAYER WIDGET SHOWDIALOG HERE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    // testing
                    state.addPlayer(Player("Alex", "Wallen", "OH", 0, "path/path"));
                    // updatePlayerData(
                    //     library[9], Player("Hector", "Herrada", "OH", 0, "path/path"));
                    // removePlayerByID(library[1]);
                  },
                  child: Icon(Icons.add),
                  backgroundColor: AppColors.primaryDarkColor,
                ),
                Container(width: 0, height: 10,),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    state.setState(() {
                      state.deleteModeOn = true;
                      Scaffold.of(context).showBottomSheet(state.deleteSnackBar);
                    });
                  },
                  child: Icon(Icons.edit),
                  backgroundColor: AppColors.primaryDarkColor,
                ),
              ],
            )
        ),
    );
  }
}