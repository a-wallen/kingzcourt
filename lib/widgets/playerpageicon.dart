import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/pages/playerlibrary.dart';
import 'package:kingzcourt/utility/theme.dart';
import 'package:kingzcourt/widgets/drawer.dart';
import '../database/databaseHelper.dart';
import '../classes/player.dart';
import '../widgets/playerfloatingbuttons.dart';

class PlayerPageIcon extends StatefulWidget {
  Player player;

  PlayerPageIcon(player) { this.player = player; }

  @override
  _PlayerPageIconState createState() => _PlayerPageIconState();
}

class _PlayerPageIconState extends State<PlayerPageIcon> {
  var border = CircleBorder();

  @override
  Widget build(BuildContext context) {
    var state = PlayerLibraryPage().of(context);
    startupDeleteToggle(state);
    return Stack(
      fit: StackFit.expand,
      children: [
        Card(shape: CircleBorder(), elevation: 0),
        FittedBox(child: Icon(Icons.account_circle_sharp, color: AppColors.primaryAccentDark,),),
        Card(shape: border, elevation: 0, color: Colors.transparent),
        Positioned(right: 3, top: 10,
            child: Text("${widget.player.getPosition()}", textAlign: TextAlign.right,
              style: TextStyle(fontWeight: FontWeight.w900, fontFamily: 'SansitaSwashed'),),
        ),
        Align(alignment: Alignment.bottomCenter,
          child: Text("${widget.player.getFirstName()}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'SansitaSwashed'),
          ),
        ),
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () { toggleDelete(state); },
          onLongPress: () {
            if (!state.deleteModeOn) {
              HapticFeedback.vibrate();
              state.setState(() {
                state.deleteModeOn = true;
                Scaffold.of(context).showBottomSheet(state.deleteSnackBar);
              });
              toggleDelete(state);
            }
          },
        ),
      ],
    );
  }

  toggleDelete(var state) {
    if(state.deleteModeOn) {
      if(!state.deleteList.contains(widget.player)) {
        state.setState(() { state.deleteList.add(widget.player); });
        setState(() {
          border = CircleBorder(side: BorderSide(color: AppColors.primaryColor, width: 5.0));
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
      border = border = CircleBorder(side: BorderSide(color: AppColors.primaryColor, width: 5.0));
    }
    else {
      border = CircleBorder();
    }
  }
}
