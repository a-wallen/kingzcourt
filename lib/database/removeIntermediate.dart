import 'package:sqflite/sqflite.dart';

Future<int> removeIntermediateValue(Database db, int g_id, int p_id) async {
  return await db.delete("INTERMEDIATE",
      where: "g_id = ?, p_id = ?", whereArgs: [g_id, p_id]);
}
