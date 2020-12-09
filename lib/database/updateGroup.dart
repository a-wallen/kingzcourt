import 'package:sqflite/sqflite.dart';

Future<int> updateGroupValue(
    Database db, int gid, Map<String, dynamic> row) async {
  return await db.update("[GROUP]", row, where: "g_id = ?", whereArgs: [gid]);
}
