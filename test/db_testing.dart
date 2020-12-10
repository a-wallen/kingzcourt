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
    Player("Alex", "Wallen", "OH", 0, "path/path"),
    Player("Kat", "Outcalt", "OP", 0, "path/path"),
    Player("Andrew", "Varela", "DS", 0, "path/path"),
    Player("Ezra", "Sackstein", "S", 0, "path/path"),
    Player("Hector", "Herrada", "OH", 0, "path/path"),
    Player("Ihor", "Sherstiuk", "M", 0, "path/path"),
    Player("Bryce", "Chinn", "M", 0, "path/path"),
    Player("Kainalu", "Lastname", "S", 0, "path/path"),
    Player("Lokene", "Lastname", "DS", 0, "path/path"),
    Player("Kiran", "Lastname", "OH", 0, "path/path"),
    Player("Cole", "Lastname", "M", 0, "path/path"),
    Player("Mitchell", "Lastname", "OP", 0, "path/path"),
    Player("Ethan", "Lastname", "OP", 0, "path/path"),
    Player("Evan", "Lastname", "DS", 0, "path/path"),
    Player("Jameson", "Lastname", "S", 0, "path/path"),
    Player("Madison", "Lastname", "S", 0, "path/path"),
    Player("Riley", "Lastname", "S", 0, "path/path"),
    Player("Dax", "Lastname", "S", 0, "path/path"),
    Player("Kyle", "Lastname", "OH", 0, "path/path"),
    Player("Kristen", "Lastname", "S", 0, "path/path"),
  ];

  groups.forEach((group) {
    DatabaseHelper.instance.insertGroup(group);
  });

  players.forEach((player) {
    DatabaseHelper.instance.insertPlayer(player);
  });
}
