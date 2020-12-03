import 'package:sqflite/sqflite.dart';

Future<void> createIntermediateTable(Database db, int version) {
  db.execute('''
    CREATE TABLE IF NOT EXISTS 
    INTERMEDIATE (
    GID INTEGER PRIMARY KEY,
    PID INTEGER PRIMARY KEY
    )
    ''');
}
