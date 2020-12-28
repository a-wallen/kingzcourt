import 'package:flutter/material.dart';
import 'package:kingzcourt/widgets/add_player_button.dart';
import 'package:kingzcourt/widgets/drawer.dart';
import 'package:kingzcourt/classes/colors.dart';
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          textTheme: Theme.of(context).textTheme,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                // height: MediaQuery.of(context).size.height / 16,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(5.0),
                color: AppColors.primaryColor,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Team size: ',
                        style: Theme.of(context).textTheme.body2,
                      ),
                      DropdownButton<String>(
                          // isDense: true,
                          dropdownColor: Colors.white,
                          icon: null,
                          value: dropDownValue,
                          items: <String>['Two', 'Three', 'Four', 'Five', 'Six']
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: Theme.of(context).textTheme.body1,
                                ));
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
              ),
              ActiveGameWidget(LandingPage.team1L, LandingPage.team2L),
              AddPlayerButton(callback: refresh),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: PlaylistWidget()),
            ],
          ),
        ),
        drawer: KingzDrawer(),
        floatingActionButton: RefreshGameButton(
            team1: LandingPage.team1L,
            team2: LandingPage.team2L,
            callback: refresh));
  }
}
