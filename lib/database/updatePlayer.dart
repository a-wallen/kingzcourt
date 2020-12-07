import 'package:sqflite/sqflite.dart';

import 'getPlayer.dart';

Future<int> updatePlayerValue(
    Database db, int pid, Map<String, dynamic> row) async {
  return await db.update("PLAYER", row, where: "p_id = ?", whereArgs: [pid]);
}
