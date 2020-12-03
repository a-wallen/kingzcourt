import 'dart:core';
import 'dart:ui';

import 'package:kingzcourt/database/initDatabase.dart';
import 'package:kingzcourt/classes/group.dart';
import 'package:kingzcourt/classes/player.dart';
import 'package:kingzcourt/classes/intermediate.dart';

void main() {
  List<Group> groups = [
    Group(0, "Alpha"),
    Group(0, "Bravo"),
    Group(0, "Charlie")
  ];

  List<Player> players = [
    Player("Alex", "OH", 0, "path/path"),
    Player("Kat", "OP", 0, "path/path"),
    Player("Andrew", "DS", 0, "path/path"),
    Player("Ezra", "S", 0, "path/path"),
    Player("Hector", "OH", 0, "path/path"),
    Player("Ihor", "M", 0, "path/path"),
    Player("Bryce", "M", 0, "path/path"),
    Player("Kainalu", "S", 0, "path/path"),
    Player("Lokene", "DS", 0, "path/path"),
    Player("Kiran", "OH", 0, "path/path"),
    Player("Cole", "M", 0, "path/path"),
    Player("Mitchell", "OP", 0, "path/path"),
    Player("Ethan", "OP", 0, "path/path"),
    Player("Evan", "DS", 0, "path/path"),
    Player("Jameson", "S", 0, "path/path"),
    Player("Madison", "S", 0, "path/path"),
    Player("Riley", "S", 0, "path/path"),
    Player("Dax", "S", 0, "path/path"),
    Player("Kyle", "OH", 0, "path/path"),
    Player("Kristen", "S", 0, "path/path"),
  ];

  groups.forEach((group) {
    DatabaseHelper.instance.insertGroup(group);
  });

  players.forEach((player) {
    DatabaseHelper.instance.insertPlayer(player);
  });
}
