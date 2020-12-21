import 'package:flutter/material.dart';
import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/pages/playerlibrary.dart';

class AddPlayerButton extends StatefulWidget {
  final Function callback;

  AddPlayerButton({Key key, @required this.callback}) : super(key: key);

  @override
  _AddPlayerButton createState() => _AddPlayerButton();
}

class _AddPlayerButton extends State<AddPlayerButton> {
  Playlist playlist = Playlist();
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => PlayerLibraryPage()))
            .then((value) => widget.callback());
      },
      color: AppColors.accentColor,
      child: Text(
        'Add player',
        style: TextStyle(fontSize: 16, color: AppColors.primaryAccent),
      ),
    );
  }
}
