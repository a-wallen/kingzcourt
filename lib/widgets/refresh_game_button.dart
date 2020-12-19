import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingzcourt/algorithms/matching_algo_ihor.dart';
import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/team_ihor.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/pages/landing.dart';

class RefreshGameButton extends StatefulWidget {
  final Team team1;
  final Team team2;
  final Function callback;

  RefreshGameButton({Key key, this.team1, this.team2, this.callback})
      : super(key: key);

  @override
  _RefreshGameButton createState() => _RefreshGameButton();
}

class _RefreshGameButton extends State<RefreshGameButton> {
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          if (widget.team1.isNotEmpty() || widget.team2.isNotEmpty()) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Still playing?'),
                    content: Text(
                        'Do you want to keep players that are currently in teams?'),
                    actions: [
                      FlatButton(
                          onPressed: () {
                            addPlayers();
                            widget.team1.clearTeam();
                            widget.team2.clearTeam();
                            Navigator.of(context).pop();
                            widget.callback();
                          },
                          child: Text('Yes')),
                      FlatButton(
                          onPressed: () {
                            widget.team1.clearTeam();
                            widget.team2.clearTeam();
                            Navigator.of(context).pop();
                            widget.callback();
                          },
                          child: Text('No'))
                    ],
                  );
                });
          } else {
            if (widget.team1.teamSize + widget.team2.teamSize <=
                LandingPage.playlist.length) {
              algorithm(widget.team1, widget.team2, LandingPage.playlist);
              widget.callback();
            } else {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Not enough players'),
                      content: Text(
                          'Number of players in playlist is not enough\n\nAdd more players or change team size'),
                      actions: [
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'))
                      ],
                    );
                  });
            }
          }
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.green);
  }

  addPlayers() {
    for (Player i in widget.team1.getPlayersOnTeam()) {
      i.waitingTime = 0;
    }
    for (Player i in widget.team2.getPlayersOnTeam()) {
      i.waitingTime = 0;
    }
    LandingPage.playlist.addAll(widget.team1.getPlayersOnTeam());
    LandingPage.playlist.addAll(widget.team2.getPlayersOnTeam());
  }
}
