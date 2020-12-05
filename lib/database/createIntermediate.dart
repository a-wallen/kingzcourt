import 'package:sqflite/sqflite.dart';

Future<void> createIntermediateTable(Database db, int version) {
  db.execute('''
    CREATE TABLE [INTERMEDIATE] (
    g_id        INTEGER NOT NULL,
    p_id        INTEGER NOT NULL,
    PRIMARY KEY (p_id, g_id)
    );
    ''');
}
