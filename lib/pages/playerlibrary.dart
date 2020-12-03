import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import 'package:kingzcourt/widgets/drawer.dart';

class PlayerLibraryPage extends StatefulWidget {
  @override
  _PlayerLibraryPageState createState() => _PlayerLibraryPageState();
}

class _PlayerLibraryPageState extends State<PlayerLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text("Saved Players"),
      ),
    );
  }
}
