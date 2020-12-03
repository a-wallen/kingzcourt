import 'package:sqflite/sqflite.dart';

Future<int> insertIntermediateValue(
    Database db, Map<String, dynamic> row) async {
  return await db.insert("INTERMEDIATE", row);
}
