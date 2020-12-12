import 'package:flutter/material.dart';

import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/pages/playerlibrary.dart';
import 'package:kingzcourt/utility/theme.dart';
import 'package:kingzcourt/widgets/drawer.dart';
import '../database/databaseHelper.dart';
import '../classes/player.dart';
import '../widgets/playerfloatingbuttons.dart';

class PlayerPageIcon extends StatefulWidget {
  int index;
  Player player;

  PlayerPageIcon(index, player) {
    this.index = index;
    this.player = player;
  }

  @override
  _PlayerPageIconState createState() => _PlayerPageIconState();
}

class _PlayerPageIconState extends State<PlayerPageIcon> {
  var border = CircleBorder();

  @override
  Widget build(BuildContext context) {
    var state = PlayerLibraryPage().of(context);
    startupDeleteToggle(state);
    return Card(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Text("${widget.index}", textAlign: TextAlign.right,),
        onTap: () { toggleDelete(state); },
        onLongPress: () {
          state.setState(() {
            state.deleteModeOn = true;
            Scaffold.of(context).showBottomSheet(state.deleteSnackBar);
          });
          toggleDelete(state);
        },
      ),
      elevation: 3.0,
      shape: border,
    );
  }

  toggleDelete(var state) {
    if(state.deleteModeOn) {
      if(!state.deleteList.contains(widget.player)) {
        state.setState(() { state.deleteList.add(widget.player); });
        setState(() {
          border = CircleBorder(side: BorderSide(color: AppColors.primaryColor, width: 3.0));
        });
      }
      else {
        state.setState(() { state.deleteList.remove(widget.player); });
        setState(() { border = CircleBorder(); });
      }
    }
  }

  startupDeleteToggle(var state) {
    if(state.deleteModeOn && state.deleteList.contains(widget.player)) {
      border = border = CircleBorder(side: BorderSide(color: AppColors.primaryColor, width: 3.0));
    }
    else {
      border = CircleBorder();
    }
  }
}
