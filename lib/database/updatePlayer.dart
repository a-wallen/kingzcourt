import 'package:sqflite/sqflite.dart';

Future<void> updatePlayerValue(
    Database db, int pid, Map<String, dynamic> row) async {
  return await db.update(
    "PLAYER",
    row,
    where: "id = ?",
    whereArgs: [pid],
  );
}
