import 'dart:ffi';

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
import 'updateGroup.dart';
import 'updatePlayer.dart';
import 'removeGroup.dart';
import 'removeIntermediate.dart';
import 'removePlayer.dart';

import '../classes/player.dart';
import '../classes/group.dart';
import '../classes/intermediate.dart';

class DatabaseHelper {
  static final _dbName = "kingzcourt.db";
  static final _dbVersion = 1;
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if (_database == null) _database = await _initiateDatabase();
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
    print("Created Group Table");
    await createPlayerTable(db, version);
    print("Created Player Table");
    await createIntermediateTable(db, version);
    print("Create Intermediate Table");
  }

  // Gets all players in db
  Future<List<Player>> getPlayerLibrary() async {
    List<Player> playerLibrary = [];
    Database db = await instance.database;
    List<Map<String, dynamic>> table = await getPlayerLib(db);
    table.forEach((row) {
      playerLibrary.add(Player.fromMap(row));
    });
    return playerLibrary;
  }

  // Get all groups in db
  Future<List<Group>> getGroupLibrary() async {
    List<Group> groupLibrary = [];
    Database db = await instance.database;
    List<Map<String, dynamic>> table = await getGroupLib(db);
    table.forEach((row) {
      groupLibrary.add(Group.fromMap(row));
    });
    return groupLibrary;
  }

  // Find a player by player id
  Future<Player> getPlayer(Player p) async {
    Player player;
    Database db = await instance.database;
    List<Map<String, dynamic>> row = await getPlayerRow(db, p.getId());
    player = Player.fromMap(row[0]);
    return player;
  }

  // Inserts a map with player data into player table
  Future<int> insertPlayer(Player p) async {
    Database db = await instance.database;
    Map<String, dynamic> row = p.toMap();
    int playerId = await insertPlayerValue(db, row);
    return playerId;
  }

  Future<int> updatePlayer(Player originData, Player newData) async {
    Database db = await instance.database;
    Map<String, dynamic> row = newData.toMap();
    // I think that successCode = 1 if the operation was successful
    int successCode = await updatePlayerValue(db, originData.getId(), row);
    return successCode;
  }

  Future<int> removePlayer(Player p) async {
    Database db = await instance.database;
    int successCode = await removePlayerByIdValue(db, p.getId());
    return successCode;
  }

  // Get all players in group by group id
  Future<List<Player>> getGroup(int id) async {
    List<Player> groupPlayers = [];
    Database db = await instance.database;
    List<Map<String, dynamic>> group = await getGroupRows(db, id);
    group.forEach((entry) {
      groupPlayers.add(Player.fromMap(entry));
    });
    return groupPlayers;
  }

  // Insert a new group into db
  Future<void> insertGroup(Group g) async {
    Database db = await instance.database;
    Map<String, dynamic> row = g.toMap();
    return await insertGroupValue(db, row);
  }

  Future<void> updateGroup(Group original, Group newGroup) async {
    Database db = await instance.database;
    Map<String, dynamic> row = newGroup.toMap();
    return await updateGroupValue(db, original.getId(), row);
  }

  // Insert an intermediate value into the database
  Future<void> insertIntermediate(Intermediate i) async {
    Database db = await instance.database;
    Map<String, dynamic> row = i.toMap();
    return await insertIntermediateValue(db, row);
  }

  Future<List<Group>> getPlayerGroups(int id) async {
    List<Group> playerGroups = [];
    Database db = await instance.database;
    List<Map<String, dynamic>> groups = await getPlayerGroupRows(db, id);
    groups.forEach((row) {
      playerGroups.add(Group.fromMap(row));
    });
    return playerGroups;
  }
}
