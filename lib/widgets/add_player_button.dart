import 'package:flutter/material.dart';
import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/player.dart';

class AddPlayerButton extends StatefulWidget {
  @override
  _AddPlayerButton createState() => _AddPlayerButton();
}

class _AddPlayerButton extends State<AddPlayerButton> {
  Playlist playlist = Playlist();
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 100,
      right: 100,
      child: RaisedButton(
          onPressed: () {
            playlist.add(Player("Firstname", "Lastname", "OH", 0, "path/path"));
            Text('Player added');
          },
          child: Text('Add Player:')),
    );
  }
}
