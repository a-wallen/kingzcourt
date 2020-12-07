import 'package:sqflite/sqflite.dart';

Future<List<Map<String, dynamic>>> getPlayerLib(Database db) async {
  return await db.query("PLAYER");
}
