import 'dart:ffi';

import 'package:path_provider/path_provider.dart';

import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'createGroupTable.dart';
import 'createIntermediate.dart';
import 'createPlayerTable.dart';
import 'insertGroup.dart';
import 'insertIntermediate.dart';
import 'insertPlayer.dart';
import 'getGroupLibrary.dart';
import 'getPlayerLibrary.dart';
import 'getGroup.dart';
import 'getPlayer.dart';
import 'getPlayerGroups.dart';

import '../classes/player.dart';
import '../classes/group.dart';
import '../classes/intermediate.dart';

class DatabaseHelper {
  static final _dbName = "myDatabase.db";
  static final _dbVersion = 1;
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  // Creates all tables for the database
  Future _onCreate(Database db, int version) async {
    await createGroupTable(db, version);
    await createPlayerTable(db, version);
    await createIntermediateTable(db, version);
  }

  // Inserts a map with player data into player table
  Future<int> insertPlayer(Player p) async {
    Database db = await instance.database;
    Map<String, dynamic> row = p.toMap();
    return await insertPlayerValue(db, row);
  }

  // Insert a new group into db
  Future<int> insertGroup(Group g) async {
    Database db = await instance.database;
    Map<String, dynamic> row = g.toMap();
    return await insertGroupValue(db, row);
  }

  // Insert an intermediate value into the database
  Future<int> insertIntermediate(Intermediate i) async {
    Database db = await instance.database;
    Map<String, dynamic> row = i.toMap();
    return await insertIntermediateValue(db, row);
  }

  // Gets all players in db
  Future<List<Player>> getPlayerLibrary() async {
    List<Player> playerLibrary;
    Database db = await instance.database;
    List<Map<String, dynamic>> table = await getPlayerLib(db);
    table.forEach((row) {
      playerLibrary.add(Player.fromMap(row));
    });
    return playerLibrary;
  }

  // Get all groups in db
  Future<List<Group>> getGroupLibrary() async {
    List<Group> groupLibrary;
    Database db = await instance.database;
    List<Map<String, dynamic>> table = await getGroupLib(db);
    table.forEach((row) {
      groupLibrary.add(Group.fromMap(row));
    });
    return groupLibrary;
  }

  // Find a player by player id
  Future<Player> getPlayer(int id) async {
    Player player;
    Database db = await instance.database;
    Map<String, dynamic> row = await getPlayerRow(db, id);
    player = Player.fromMap(row);
    return player;
  }

  // Get all players in group by group id
  Future<List<Player>> getGroup(int id) async {
    List<Player> groupPlayers;
    Database db = await instance.database;
    List<Map<String, dynamic>> group = await getGroupRows(db, id);
    group.forEach((entry) {
      groupPlayers.add(Player.fromMap(entry));
    });
    return groupPlayers;
  }

  Future<List<Group>> getPlayerGroups(int id) async {
    List<Group> playerGroups;
    Database db = await instance.database;
    List<Map<String, dynamic>> groups = await getPlayerGroupRows(db, id);
    groups.forEach((row) {
      playerGroups.add(Group.fromMap(row));
    });
    return playerGroups;
  }
}
