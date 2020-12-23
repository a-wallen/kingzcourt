import 'package:sqflite/sqflite.dart';

Future<List<Map<String, dynamic>>> getGroupLib(Database db, int gid) async {
  return await db.rawQuery('''
select num_players from [GROUP] g
where g.g_id = ${gid});
''');
}
