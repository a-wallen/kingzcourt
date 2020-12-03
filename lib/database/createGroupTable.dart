import 'package:sqflite/sqflite.dart';

Future<void> createGroupTable(Database db, int version) {
  db.execute('''
    CREATE TABLE GROUP
    GID INTEGER PRIMARY KEY,
    SIZE INTEGER NOT NULL,
    NAME TEXT NOT NULL,
    ''');
}
