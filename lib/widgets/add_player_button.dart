import 'package:flutter/material.dart';
import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/pages/playerlibrary.dart';
import 'package:kingzcourt/pages/grouplibrary.dart';

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
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('How would you like to add players?'),
                content: Text('Choose from where to add players'),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlayerLibraryPage()))
                            .then((_) {
                          Navigator.of(context).pop();
                          widget.callback();
                        });
                      },
                      child: Text('Player Library')),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    GroupLibraryPage(true))).then((_) {
                          Navigator.of(context).pop();
                          widget.callback();
                        });
                      },
                      child: Text('Group Library'))
                ],
              );
            });
      },
      color: AppColors.accentColor,
      child: Text(
        'Add player',
        style: TextStyle(fontSize: 16, color: AppColors.primaryAccent),
      ),
    );
  }
}
