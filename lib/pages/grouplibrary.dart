import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kingzcourt/widgets/drawer.dart';
import 'package:kingzcourt/widgets/testWidget.dart';

class GroupLibraryPage extends StatefulWidget {
  _GroupLibraryPageState of(BuildContext c) { return c.findAncestorStateOfType<_GroupLibraryPageState>(); }

  @override
  _GroupLibraryPageState createState() => _GroupLibraryPageState();
}

class _GroupLibraryPageState extends State<GroupLibraryPage> {
  int test = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text("Saved Groups"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("$test", style: TextStyle(fontSize: 50)),
            TestWidget(),
          ],
        ),
      ),
    );
  }
}
