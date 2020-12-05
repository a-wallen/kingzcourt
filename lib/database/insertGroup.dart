import 'package:sqflite/sqflite.dart';

Future<void> insertGroupValue(Database db, Map<String, dynamic> row) async {
  return await db.execute('''
    INSERT INTO GROUP(num_players, group_name) 
    VALUES (
      ${row['groupSize']},
      ${row['groupName']}
    )
    ''');
}
