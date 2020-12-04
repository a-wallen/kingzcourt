import 'package:sqflite/sqflite.dart';

Future<void> insertPlayerValue(Database db, Map<String, dynamic> row) async {
  return await db.insert("PLAYER", row);
}
