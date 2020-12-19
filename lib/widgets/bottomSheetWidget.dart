import 'package:flutter/material.dart';
import 'package:kingzcourt/pages/landing.dart';
import 'package:kingzcourt/classes/player.dart';

class BottomSheetWidget extends StatefulWidget {
  final Player sender;

  BottomSheetWidget({Key key, @required this.sender}) : super(key: key);

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),

        // boxShadow: [
        //   BoxShadow(blurRadius: 10, color: Colors.grey[300], spreadRadius: 5)
        // ]
      ),
      margin: EdgeInsets.only(top: 5),
      height: 210,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => {
              LandingPage.playlist.prioritize(widget.sender),
              Navigator.of(context).pop(),
            },
            child: ListTile(
              leading: Text(
                'Prioritize',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              LandingPage.playlist.remove(widget.sender),
              Navigator.of(context).pop(),
            },
            child: ListTile(
              leading: Text(
                'Remove',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.clear,
                color: Colors.red,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              LandingPage.playlist.wait(widget.sender),
              Navigator.of(context).pop(),
            },
            child: ListTile(
              leading: Text(
                'Wait',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.error_outline, color: Colors.yellow[700]),
            ),
          )
        ],
      ),
    );
  }
}
