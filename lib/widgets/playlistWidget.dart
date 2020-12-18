import 'package:flutter/material.dart';
import 'package:kingzcourt/classes/Playlist.dart';
import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/pages/landing.dart';
import 'package:kingzcourt/widgets/bottomSheetWidget.dart';
import '../classes/player.dart';
import 'package:kingzcourt/database/databaseHelper.dart';

class PlaylistWidget extends StatefulWidget {
  @override
  _PlaylistWidgetState createState() => _PlaylistWidgetState();
}

class _PlaylistWidgetState extends State<PlaylistWidget> {
  final List<String> itemsTest = List<String>.generate(20, (i) => "Player $i");
  final Playlist playlist = LandingPage.playlist;

  @override
  Widget build(BuildContext context) {
    if (playlist.isNotEmpty) {
      return ListView.builder(
        itemCount: itemsTest.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Row(
                children: [
                  Expanded(child: Text('${playlist.elementAt(index)}')),
                  Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          height: 15,
                        ),
                        Text(
                          //TODO
                          '',
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
                      Text('0', style: TextStyle(fontSize: 12)),
                      Text(
                        'wait',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  )
                ],
              ),
              leading: Icon(Icons.account_circle_outlined),
              trailing: IconButton(
                  icon: Icon(Icons.keyboard_control),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => BottomSheetWidget(),
                    );
                  }),
            ),
          );
        },
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: Text('Playlist is empty. Try adding players.',
            style: TextStyle(fontSize: 20, color: AppColors.primaryAccentDark)),
      );
    }
  }
}
