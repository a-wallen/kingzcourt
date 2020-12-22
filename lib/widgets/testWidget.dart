// test widget by Katherine
import 'package:flutter/material.dart';
import 'package:kingzcourt/pages/grouplibrary.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    var state = GroupLibraryPage(false).of(context);
    return RaisedButton(
      onPressed: () {
        state.setState(() => state.test++);
      },
      child: Text(state.test.toString(), style: TextStyle(fontSize: 15)),
    );
  }
}
