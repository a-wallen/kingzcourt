import 'package:sqflite/sqflite.dart';

Future<void> createPlayerTable(Database db, int version) {
  db.execute('''CREATE TABLE PLAYER (
    p_id        INTEGER PRIMARY KEY ASC AUTOINCREMENT
                          UNIQUE
                         NOT NULL,
    first_name  TEXT NOT NULL,
    last_name   TEXT NOT NULL,
    position    TEXT NOT NULL,
    profile_pic TEXT
);''');
}

/*
CREATE TABLE PLAYER (
    p_id        INTEGER PRIMARY KEY ASC AUTOINCREMENT
                          UNIQUE
                         NOT NULL,
    first_name  TEXT NOT NULL,
    last_name   TEXT NOT NULL,
    position    TEXT NOT NULL,
    profile_pic TEXT
);
*/
