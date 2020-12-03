import 'package:sqflite/sqflite.dart';

Future<int> insertGroupValue(Database db, Map<String, dynamic> row) async {
  return await db.insert("GROUP", row);
}
