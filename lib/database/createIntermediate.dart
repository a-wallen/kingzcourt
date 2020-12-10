import 'package:sqflite/sqflite.dart';

Future<void> createIntermediateTable(Database db, int version) {
  db.execute('''
   CREATE TABLE PLAYER_GROUP (
    g_id  INTEGER REFERENCES [GROUP] (g_id) 
                  NOT NULL,
    p_id  INTEGER REFERENCES PLAYER (p_id) 
                  NOT NULL,
    pg_id INTEGER PRIMARY KEY AUTOINCREMENT
                  NOT NULL
    );
    ''');
}

/*
pg_id is the arbitrary primary key for this intermediate table
CREATE TABLE PLAYER_GROUP (
    g_id  INTEGER REFERENCES [GROUP] (g_id) 
                  NOT NULL,
    p_id  INTEGER REFERENCES PLAYER (p_id) 
                  NOT NULL,
    pg_id INTEGER PRIMARY KEY AUTOINCREMENT
                  NOT NULL
);
*/
