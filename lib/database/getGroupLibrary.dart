import 'package:sqflite/sqflite.dart';

Future<List<Map<String, dynamic>>> getGroupLib(Database db) async {
  return await db.query("GROUP");
}
