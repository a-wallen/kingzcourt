import 'package:sqflite/sqflite.dart';

Future<void> createIntermediateTable(Database db, int version) {
  db.execute('''
   CREATE TABLE PLAYER_GROUP (
    p_id INTEGER PRIMARY KEY
                 REFERENCES PLAYER (p_id) 
                 NOT NULL,
    g_id INTEGER PRIMARY KEY
                 REFERENCES [GROUP] (g_id) 
                 NOT NULL
    );
    ''');
}

/*
CREATE TABLE PLAYER_GROUP (
    p_id INTEGER PRIMARY KEY
                 REFERENCES PLAYER (p_id) 
                 NOT NULL,
    g_id INTEGER PRIMARY KEY
                 REFERENCES [GROUP] (g_id) 
                 NOT NULL
);
*/
