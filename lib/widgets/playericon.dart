import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingzcourt/classes/colors.dart';
import '../classes/player.dart';

class PlayerPageIcon extends StatefulWidget {
  Player player;

  PlayerPageIcon(player) {
    this.player = player;
  }

  @override
  _PlayerPageIconState createState() => _PlayerPageIconState();
}

class _PlayerPageIconState extends State<PlayerPageIcon> {
  var border = CircleBorder();

  @override
  Widget build(BuildContext context) {
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
          onTap: null,
          onLongPress: null,
        ),
      ],
    );
  }
}
