import 'package:flutter/material.dart';

class ActivePlayerWidget extends StatefulWidget {
  @override
  _ActivePlayerWidgetState createState() => _ActivePlayerWidgetState();
}

class _ActivePlayerWidgetState extends State<ActivePlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: [
          Positioned(bottom: 0, child: Text('Name')),
          Icon(Icons.person),
          Positioned(top: 0, right: 0, child: Text('Position'))
        ]),
        color: Colors.lightGreenAccent);
    //setState() {}
  }
}
