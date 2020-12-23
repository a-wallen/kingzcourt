import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/pages/groupInspector.dart';
import 'package:kingzcourt/pages/landing.dart';
import '../classes/player.dart';

class GroupInspIcon extends StatefulWidget {
  Player player;
  bool addPlayer;

  GroupInspIcon(player, {bool addPlayer = false}) {
    this.player = player;
    this.addPlayer = addPlayer;
  }

  @override
  _GroupInspIconState createState() => _GroupInspIconState();
}

class _GroupInspIconState extends State<GroupInspIcon> {
  var border = CircleBorder();

  @override
  Widget build(BuildContext context) {
    var state = GroupInspector.of(context);
    startupDeleteToggle(state);
    return Stack(
      fit: StackFit.expand,
      children: [
        Card(shape: CircleBorder(), elevation: 3),
        Card(
          shape: border,
          elevation: 0,
          color: Colors.transparent,
          child: widget.player.getImageFilePath() == null
              ? FittedBox(
              fit: BoxFit.fill,
              child: Icon(Icons.account_circle_sharp,
                  color: AppColors.primaryAccentDark))
              : ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.memory(
              base64Decode(widget.player.getImageFilePath()),
            ),
          ),
        ),
        Positioned(
          right: 3,
          top: 10,
          child: Text(
            "${widget.player.getPosition()}",
            textAlign: TextAlign.right,
            style: TextStyle(
                shadows: [Shadow(color: Colors.white, blurRadius: 10.0)],
                fontWeight: FontWeight.w900,
                fontSize: 24,
                fontFamily: 'SansitaSwashed'),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            "${widget.player.getFirstName()}",
            style: TextStyle(
                shadows: [Shadow(color: Colors.white, blurRadius: 10.0)],
                // color: widget.player.getImageFilePath() == null
                //     ? Colors.black
                //     : AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'SansitaSwashed'),
          ),
        ),
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            toggleDelete(state);
            if (widget.addPlayer) {
              getPlayer(state);
            }
          },
          onLongPress: () {
            if (!state.deleteModeOn) {
              HapticFeedback.vibrate();
              state.setState(() {
                state.deleteModeOn = true;
                state.deleteList.add(widget.player);
                Scaffold.of(context).showBottomSheet(state.deleteSnackBar);
              });
            }
          },
        ),
      ],
    );
  }

  getPlayer(state) {
    if (!state.deleteModeOn) {
      LandingPage.playlist.add(widget.player);
      Navigator.of(context).pop();
    }
  }

  toggleDelete(var state) {
    if (state.deleteModeOn) {
      if (!state.deleteList.contains(widget.player)) {
        state.setState(() {
          state.deleteList.add(widget.player);
        });
        setState(() {
          border = CircleBorder(
              side: BorderSide(color: AppColors.primaryColor, width: 8.3));
        });
      } else {
        state.setState(() {
          state.deleteList.remove(widget.player);
        });
        setState(() {
          border = CircleBorder();
        });
      }
    }
  }

  startupDeleteToggle(var state) {
    if (state.deleteModeOn && state.deleteList.contains(widget.player)) {
      border = border = CircleBorder(
          side: BorderSide(color: AppColors.primaryColor, width: 8.3));
    } else {
      border = CircleBorder();
    }
  }
}
