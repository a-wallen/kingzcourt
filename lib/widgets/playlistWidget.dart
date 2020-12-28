import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/widgets/bottomSheetWidget.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/pages/landing.dart';
import 'package:kingzcourt/classes/Playlist.dart';

class PlaylistWidget extends StatefulWidget {
  @override
  _PlaylistWidgetState createState() => _PlaylistWidgetState();
}

class _PlaylistWidgetState extends State<PlaylistWidget> {
  final Playlist playlist = LandingPage.playlist;

  @override
  Widget build(BuildContext context) {
    if (playlist.isNotEmpty) {
      return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: AppColors.primaryAccentDark,
          height: 1.0,
        ),
        itemCount: playlist.length,
        itemBuilder: (context, index) {
          Player curPlayer = playlist.elementAt(index);
          return Card(
            elevation: 0.0,
            child: ListTile(
              tileColor: curPlayer.getSkipGame() == false
                  ? Colors.transparent
                  : Colors.grey[400],
              title: Row(
                children: [
                  Expanded(
                      child: Text(
                          '${curPlayer.getFirstName()} \t ${curPlayer.getLastName()}')),
                  Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          height: 15,
                        ),
                        Text(
                          '${curPlayer.getPosition()}',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'pos',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[700]),
                        )
                      ]),
                  Container(
                    width: 15,
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        height: 15,
                      ),
                      Text('${curPlayer.getWaitingTime()}',
                          style: TextStyle(fontSize: 12)),
                      Text(
                        'wait',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  )
                ],
              ),
              leading: curPlayer.getImageFilePath() == null
                  ? Container(
                      width: 40,
                      height: 40,
                      child:
                          FittedBox(child: Icon(Icons.account_circle_outlined)))
                  : CircleAvatar(
                      backgroundImage: MemoryImage(
                          base64Decode(curPlayer.getImageFilePath())),
                    ),
              trailing: IconButton(
                  icon: Icon(Icons.keyboard_control),
                  onPressed: () {
                    var sheetController = showModalBottomSheet(
                      context: context,
                      builder: (context) =>
                          BottomSheetWidget(sender: curPlayer),
                    );
                    sheetController.whenComplete(() => setState(() {}));
                  }),
            ),
          );
        },
      );
    } else {
      return Center(
        child: Container(
          alignment: Alignment.center,
          child: Text('Playlist is empty. Add players.',
              style:
                  TextStyle(fontSize: 20, color: AppColors.primaryAccentDark)),
        ),
      );
    }
  }
}
