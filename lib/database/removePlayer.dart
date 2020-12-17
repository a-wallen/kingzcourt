import 'package:sqflite/sqflite.dart';

Future<int> removePlayerByIdValue(Database db, int p_id) async {
  db.delete("PLAYER", where: "p_id = ?", whereArgs: [p_id]);
  db.delete("PLAYER_GROUP", where: "p_id = ?", whereArgs: [p_id]);
}
