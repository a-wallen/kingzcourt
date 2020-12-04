// test widget by Katherine
import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: null,
      child: Text(
        'Dis a button',
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
