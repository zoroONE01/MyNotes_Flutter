import 'package:my_notes/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _dbName = 'NotesDB.db';
  static const _dbVersion = 1;
  static const tbNote = "Note";
  static const clId = '_id';
  static const clTitle = 'title';
  static const clContent = 'content';
  static const clIsTrash = 'isTrash';
  static const clIsHidden = 'isHidden';
  static const clIsFavourites = 'isFavourites';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tbNote (
            $clId INTEGER PRIMARY KEY AUTOINCREMENT,
            $clTitle TEXT NOT NULL,
            $clContent INTEGER NOT NULL,
            $clIsFavourites INTEGER NOT NULL DEFAULT 0,
            $clIsTrash INTEGER NOT NULL DEFAULT 0,
            $clIsHidden INTEGER NOT NULL DEFAULT 0
          )
          ''');
  }

  Future<int> insertNote(Note note) async {
    Database db = await instance.database;
    return await db
        .insert(tbNote, {clTitle: note.title, clContent: note.content});
  }

  Future<List<Map<String, dynamic>>> findAllNote() async {
    Database db = await instance.database;
    return await db.query(tbNote, orderBy: '$clId DESC');
  }

  Future<List<Map<String, dynamic>>> findNoteById(int id) async {
    Database db = await instance.database;
    return await db.query(tbNote, where: "$clId = $id");
  }

  Future<int?> queryNoteRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tbNote'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> updateNote(Note note) async {
    Database db = await instance.database;
    int id = note.toMap()[clId] as int;
    return await db
        .update(tbNote, note.toMap(), where: '$clId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> deleteNote(int id) async {
    Database db = await instance.database;
    return await db.delete(tbNote, where: '$clId = ?', whereArgs: [id]);
  }
}
