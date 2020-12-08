import 'package:sqflite/sqflite.dart';

Future<int> removeGroupValue(Database db, int g_id) async {
  return await db.delete("[GROUP]", where: "g_id = ?", whereArgs: [g_id]);
}
