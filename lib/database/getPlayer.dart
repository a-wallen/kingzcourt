import 'package:sqflite/sqflite.dart';

Future<List<Map<String, dynamic>>> getPlayerRow(Database db, int pid) async {
  Future<List<Map<String, dynamic>>> result;
  result = db.query("PLAYER",
      where: "p_id = ?", whereArgs: [pid], limit: 1, distinct: true);
  return result;
}
