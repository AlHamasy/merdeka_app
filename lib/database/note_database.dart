import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/note.dart';

class NoteDatabase{

  static NoteDatabase instance = NoteDatabase();

  Future<Database> get database async{
    return await initDatabase("notes.db");
  }

  Future<Database> initDatabase(String databaseName) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, databaseName);
    return await openDatabase(path, version: 1, onCreate: createTable);
  }

  Future createTable(Database database, int version) async{
    String sql = '''
    CREATE TABLE $tableNotes(
    ${NoteFields.id} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${NoteFields.title} TEXT NOT NULL,
    ${NoteFields.category} TEXT NOT NULL,
    ${NoteFields.priority} TEXT NOT NULL,
    ${NoteFields.days} TEXT NOT NULL,
    ${NoteFields.isCompleted} BOOLEAN NOT NULL,
    ${NoteFields.time} TEXT NOT NULL
    )
    ''';
    await database.execute(sql);
  }

  static Future insertNote(Note note) async{
    final db = await instance.database;
    return db.insert(tableNotes, note.toMap());
  }

  static Future<List<Note>> getAllNote() async{
    final db = await instance.database;
    final result = await db.query(
        tableNotes,
        orderBy: "${NoteFields.time} DESC"
    );
    return result.map((note) => Note.fromMap(note)).toList();
  }

  static Future<Note> getNoteById(int id) async{
    final db = await instance.database;
    final result = await db.query(
        tableNotes,
        where: "${NoteFields.id} = ?",
        whereArgs: [id]
    );
    if (result.isNotEmpty){
      return Note.fromMap(result.first);
    } else {
      throw Exception("ID $id not found");
    }
  }

  static Future updateNote(Note note) async{
    final db = await instance.database;
    return await db.update(
        tableNotes,
        note.toMap(),
        where: "${NoteFields.id} = ?",
        whereArgs: [note.id]
    );
  }

  static Future deleteNote(int id) async{
    final db = await instance.database;
    return await db.delete(
        tableNotes,
        where: "${NoteFields.id} = ?",
        whereArgs: [id]
    );
  }
}