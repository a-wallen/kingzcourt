import 'package:sqflite/sqflite.dart';

Future<List<Map<String, dynamic>>> getGroupLibPlayerCount(
    Database db, int gid) async {
  return await db.rawQuery('''
select COUNT(*)
from PLAYER_GROUP pg
where pg.g_id = ${gid};
''');
}
