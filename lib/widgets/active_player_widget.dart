import 'package:flutter/material.dart';

class ActivePlayerWidget extends StatefulWidget {
  @override
  _ActivePlayerWidgetState createState() => _ActivePlayerWidgetState();
}

class _ActivePlayerWidgetState extends State<ActivePlayerWidget> {
  @override
  Widget build(BuildContext context) {
    Stack(children: [
      Positioned(bottom: 0, child: Text('Player name')),
      Positioned(
          left: 0,
          top: 0,
          child: CircleAvatar(backgroundImage: NetworkImage('defaultImage'))),
      Positioned(top: 0, right: 0, child: Text('Position'))
    ]);
    setState() {}
  }
}
