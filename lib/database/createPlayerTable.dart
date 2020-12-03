import 'package:sqflite/sqflite.dart';

Future<void> createPlayerTable(Database db, int version) {
  db.execute('''
    CREATE TABLE IF NOT EXISTS 
    PLAYER (
    PID INTEGER PRIMARY KEY,
    NAME TEXT NOT NULL,
    POSITION TEXT NOT NULL,
    IMAGE TEXT NOT NULL
    )
    ''');
}
