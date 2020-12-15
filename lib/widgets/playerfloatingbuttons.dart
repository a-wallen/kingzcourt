import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:kingzcourt/classes/colors.dart';
import 'package:kingzcourt/utility/theme.dart';
import 'package:kingzcourt/widgets/drawer.dart';
import '../database/databaseHelper.dart';
import '../classes/player.dart';
import '../pages/playerlibrary.dart';

class PlayerFloatingButtons extends StatefulWidget {
  @override
  _PlayerFloatingButtonsState createState() => _PlayerFloatingButtonsState();
}

class _PlayerFloatingButtonsState extends State<PlayerFloatingButtons> {
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  ImagePicker picker = new ImagePicker();
  var border = CircleBorder();
  List<String> positions;
  int selectedIndex;
  String _img64;

  Future _imgFromGallery() async {
    PickedFile image =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    Uint8List bytes = await image.readAsBytes();
    setState(() {
      _img64 = base64Encode(bytes);
      print("bytes: $_img64");
    });
  }

  @override
  void initState() {
    selectedIndex = 0;
    positions = ['OH', 'M', 'OP', 'S', 'L'];
    super.initState();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = PlayerLibraryPage().of(context);
    return Builder(
      builder: (context) => Visibility(
          visible: !state.deleteModeOn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => new AlertDialog(
                              title: Text("Add Player"),
                              content: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                  width: 240,
                                  height: 360,
                                  child: Column(children: [
                                    //TODO: Be able to have user entering pictures
                                    Flexible(
                                      child: GestureDetector(
                                        onTap: () => _imgFromGallery(),
                                        child: FittedBox(
                                          child: _img64 == null
                                              ? Icon(
                                                  Icons.account_circle_sharp,
                                                  color: AppColors
                                                      .primaryAccentDark,
                                                )
                                              : Image.memory(
                                                  base64Decode(_img64)),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller: firstName,
                                      decoration: InputDecoration(
                                          hintText: 'First Name'),
                                    ),
                                    TextFormField(
                                      controller: lastName,
                                      decoration: InputDecoration(
                                          hintText: 'Last Name'),
                                    ),
                                    Container(
                                        color: Colors.black,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                12,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          padding: const EdgeInsets.all(16),
                                          itemCount: positions.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return FlatButton(
                                                color: index == selectedIndex
                                                    ? AppColors.primaryDarkColor
                                                    : Colors.white,
                                                onPressed: () => {
                                                      setState(() {
                                                        selectedIndex = index;
                                                        print(selectedIndex);
                                                      })
                                                    },
                                                child: Text(positions[index],
                                                    style: TextStyle(
                                                        color: index ==
                                                                selectedIndex
                                                            ? Colors.white
                                                            : AppColors
                                                                .primaryDarkColor)));
                                          },
                                        )),
                                  ]),
                                ),
                              ),
                              actions: <Widget>[
                                new FlatButton(
                                  color: Colors.red,
                                  textColor: Colors.white,
                                  child: Text('CANCEL'),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                                new FlatButton(
                                    color: Colors.green,
                                    textColor: Colors.white,
                                    child: new Text('ADD'),
                                    onPressed: () {
                                      state.addPlayer(Player(
                                          firstName.text,
                                          lastName.text,
                                          positions[selectedIndex],
                                          0,
                                          _img64));
                                      {}
                                      Navigator.of(context).pop();
                                    })
                              ]));
                  /*state.addPlayer(
                      Player(firstName.text, "Wallen", "OH", 0, "path/path"));*/
                  // updatePlayerData(
                  //     library[9], Player("Hector", "Herrada", "OH", 0, "path/path"));
                  // removePlayerByID(library[1]);
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
                child: Icon(Icons.edit),
                backgroundColor: AppColors.primaryDarkColor,
              ),
            ],
          )),
    );
  }
}
