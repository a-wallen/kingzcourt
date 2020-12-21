import 'package:flutter/material.dart';
import 'package:kingzcourt/widgets/add_player_button.dart';
import 'package:kingzcourt/widgets/drawer.dart';
import 'package:flutter/widgets.dart';
import 'package:kingzcourt/widgets/refresh_game_button.dart';
import 'package:kingzcourt/widgets/active_game_widget.dart';
import 'package:kingzcourt/classes/team_ihor.dart';
import 'package:kingzcourt/widgets/playlistWidget.dart';
import 'package:kingzcourt/classes/Playlist.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key, this.title}) : super(key: key);
  final String title;
  static Team team1L = Team('Team1', 6);
  static Team team2L = Team('team2', 6);
  static Playlist playlist = Playlist();

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentIndex = 0;

  refresh() {
    setState(() {});
  }

  Map<String, int> dropValues = {
    'Two': 2,
    'Three': 3,
    'Four': 4,
    'Five': 5,
    'Six': 6
  };

  String dropDownValue = 'Six';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          textTheme: Theme.of(context).textTheme,
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            Container(
                height: 35,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Team1',
                      style: TextStyle(fontSize: 18),
                    ),
                    Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text('Team size: '),
                          DropdownButton<String>(
                              dropdownColor: Colors.white,
                              value: dropDownValue,
                              items: <String>[
                                'Two',
                                'Three',
                                'Four',
                                'Five',
                                'Six'
                              ].map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList(),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropDownValue = newValue;
                                  LandingPage.team1L
                                      .updateTeamSize(dropValues[newValue]);
                                  LandingPage.team2L
                                      .updateTeamSize(dropValues[newValue]);
                                });
                              }),
                        ]),
                    Text(
                      'Team2',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )),
            Divider(),
            ActiveGameWidget(LandingPage.team1L, LandingPage.team2L),
            AddPlayerButton(callback: refresh),
            Expanded(child: PlaylistWidget()),
          ],
        ),
        drawer: KingzDrawer(),
        floatingActionButton: RefreshGameButton(
            team1: LandingPage.team1L,
            team2: LandingPage.team2L,
            callback: refresh));
  }
}
