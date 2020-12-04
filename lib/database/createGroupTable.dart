import 'package:sqflite/sqflite.dart';

Future<void> createGroupTable(Database db, int version) {
  db.execute('''
    CREATE TABLE [GROUP] (
    g_id        INTEGER PRIMARY KEY ASC AUTOINCREMENT
                        NOT NULL
                        UNIQUE,
    num_players INTEGER NOT NULL,
    group_name  TEXT    NOT NULL
    );
    ''');
}

/*
CREATE TABLE [GROUP] (
    g_id        INTEGER PRIMARY KEY
                        NOT NULL
                        UNIQUE,
    num_players INTEGER NOT NULL,
    group_name  TEXT    NOT NULL
);
*/
