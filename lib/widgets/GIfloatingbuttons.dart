import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kingzcourt/classes/group.dart';

import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/database/getGroupLibrary.dart';
import '../database/databaseHelper.dart';
import '../classes/player.dart';
import '../pages/groupInspector.dart';
import 'package:kingzcourt/classes/intermediate.dart';

class GI_FloatingButtons extends StatefulWidget {
  @override
  _GI_FloatingButtonsState createState() => _GI_FloatingButtonsState();
}

class _GI_FloatingButtonsState extends State<GI_FloatingButtons> {
  ImagePicker picker = new ImagePicker();
  var border = CircleBorder();
  List<String> positions;
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    var state = GroupInspector.of(context);
    return Builder(
      builder: (context) => Visibility(
          visible: !state.deleteModeOn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  state.getPlayersInGroup();
                  state.getPlayerLibrary();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                          builder: (context, setState) => AlertDialog(
                                title: Text("Add Players"),
                                content: Container(
                                    height: 360.0,
                                    width: 240.0,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: state.library.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                            onTap: () {
                                              if (state.selectedIndexes
                                                  .contains(index)) {
                                                setState(() {
                                                  state.selectedIndexes
                                                      .remove(index);
                                                });
                                              } else {
                                                setState(() {
                                                  state.selectedIndexes
                                                      .add(index);
                                                });
                                              }
                                            },
                                            leading: Icon(Icons.person),
                                            trailing: state.selectedIndexes
                                                    .contains(index)
                                                ? Icon(Icons.check_box,
                                                    color:
                                                        AppColors.primaryColor)
                                                : Icon(Icons
                                                    .check_box_outline_blank),
                                            title: Text(state.library[index]
                                                .getFirstName()),
                                          );
                                        })),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("add players"),
                                    color: AppColors.primaryColor,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      List<Player> temp = [];
                                      Group newgroup = state.widget.myGroup;
                                      state.selectedIndexes.forEach((i) {
                                        temp.add(state.library[i]);
                                      });
                                      temp.forEach((player) {
                                        DatabaseHelper.instance
                                            .insertIntermediate(Intermediate(
                                                player.getId(),
                                                state.widget.myGroup.getId()));
                                      });
                                      newgroup.setNumPlayers(
                                          state.widget.myGroup.getNumPlayers() +
                                              temp.length);
                                      DatabaseHelper.instance.updateGroup(
                                          state.widget.myGroup, newgroup);
                                      state.selectedIndexes.clear();
                                      state.getPlayersInGroup();
                                      state.getPlayerLibrary();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ));
                    },
                  );
                },
                child: Icon(Icons.add),
                backgroundColor: AppColors.primaryDarkColor,
              ),
              Container(
                width: 0,
                height: 10,
              ),
              FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  state.setState(() {
                    state.deleteModeOn = true;
                    Scaffold.of(context).showBottomSheet(state.deleteSnackBar);
                  });
                },
                child: Icon(Icons.delete_forever_sharp),
                backgroundColor: AppColors.primaryDarkColor,
              ),
            ],
          )),
    );
  }
}
