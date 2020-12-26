import 'package:flutter/material.dart';

class KingzAppBar extends StatelessWidget {
  String title;
  KingzAppBar(String t){
    this.title = t;
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      textTheme: Theme.of(context).textTheme,
      title: Text(this.title),
    );
  }
}
