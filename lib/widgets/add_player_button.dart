import 'package:flutter/material.dart';
import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/player.dart';

class AddPlayerButton extends StatefulWidget {
  @override
  _AddPlayerButtonState createState() => _AddPlayerButtonState();
}

class _AddPlayerButtonState extends State<AddPlayerButton> {
  Playlist playlist = Playlist();
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          playlist
              .add(Player("Firstname", "Lastname", "OH", 0, "path/path")); //?
        },
        child: Text('Add Player:'));
  }
}
