import 'package:sqflite/sqflite.dart';
import 'package:kingzcourt/database/databaseHelper.dart';

Future<List<Map<String, dynamic>>> getGroupRows(Database db, int gid) async {
  /* List<int> player_ids = [];
  List<Map<String, dynamic>> players = [];
  List<Map<String, dynamic>> intermediateQuery = await db.query("PLAYER_GROUP", where: "g_id = ?", whereArgs: [gid]);
  intermediateQuery.forEach((element) {
    player_ids.add(element["p_id"]);
  });
  player_ids.forEach((player_id) async {
    List<Map<String, dynamic>> row = await db.query("PLAYER", where: "p_id = ?", whereArgs: [player_id]);
    row.forEach((entry) {
      players.add(entry);
    });
  });
  print(players);
  return players;*/

  return await db.rawQuery('''
select * from PLAYER p
where p.p_id in (select pg.p_id from PLAYER_GROUP pg
where pg.g_id = ${gid});
''');
}
