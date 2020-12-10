import 'package:sqflite/sqflite.dart';

Future<int> removeIntermediateValue(Database db, int g_id, int p_id) async {
  return await db.rawDelete('''
delete from PLAYER_GROUP
where p_id = ${p_id} 
and g_id = ${g_id};''');
}

/*
-- find where to delete in the intermediate
g_id = ?, p_id = ?

return await db.rawdelete('''
delete from PLAYER_GROUP
where p_id = ${p_id} 
and g_id = ${g_id};''')
*/
