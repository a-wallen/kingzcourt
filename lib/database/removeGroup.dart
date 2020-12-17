import 'package:sqflite/sqflite.dart';

Future<int> removeGroupValue(Database db, int g_id) async {
  db.delete("[GROUP]", where: "g_id = ?", whereArgs: [g_id]);
  return await db.delete("PLAYER_GROUP", where: "g_id = ?", whereArgs: [g_id]);
}
