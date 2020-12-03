import 'package:sqflite/sqflite.dart';

Future<int> insertPlayerValue(Database db, Map<String, dynamic> row) async {
  return await db.insert("PLAYER", row);
}
