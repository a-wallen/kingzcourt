import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
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
            onTap: () => print('Priorotize'),
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
            onTap: () => print('Remove'),
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
            onTap: () => print('Wait'),
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
