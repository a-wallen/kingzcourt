import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:kingzcourt/widgets/drawer.dart';

class GroupLibraryPage extends StatefulWidget {
  @override
  _GroupLibraryPageState createState() => _GroupLibraryPageState();
}

class _GroupLibraryPageState extends State<GroupLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text("Saved Groups"),
      ),
    );
  }
}
