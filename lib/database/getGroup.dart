import 'package:sqflite/sqflite.dart';

Future<List<Map<String, dynamic>>> getGroupRows(Database db, int gid) async {
  return await db.query("PLAYER_GROUP", where: "g_id = ?", whereArgs: [gid]);
}
