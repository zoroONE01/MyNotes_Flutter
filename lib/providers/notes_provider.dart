import 'package:flutter/material.dart';

import '../data/local/database_helper.dart';
import '../models/note.dart';

class NotesProvider with ChangeNotifier {
  int _noteCategory = 0;
  List<Note> notes = [];
  DatabaseHelper dbHelper = DatabaseHelper.instance;

  NotesProvider() {
    findAllNote();
  }

  //thêm sửa xóa
  void insertNote(String title, String content) async {
    Note note = Note(title: title, content: content);
    dbHelper.insertNote(note);
  }

  void updateNote(int id, String title, String content, Note oldNote) async {
    Note note = Note(
        id: id,
        title: title,
        content: content,
        isHidden: oldNote.isHidden,
        isFav: oldNote.isFav,
        isTrash: oldNote.isTrash);
    dbHelper.updateNote(note);
  }

  void deleteNote(int id) async {
    dbHelper.deleteNote(id);
  }

  //category
  void moveToAllNote(int id) async {
    notes[id].isHidden = 0;
    notes[id].isTrash = 0;
    notes[id].isFav = 0;
    dbHelper.updateNote(notes[id]);
  }

  void moveToTrash(int id) async {
    notes[id].isTrash = 1;
    dbHelper.updateNote(notes[id]);
  }

  void moveToHide(int id) async {
    notes[id].isHidden = 1;
    dbHelper.updateNote(notes[id]);
  }

  void moveToFav(int id) async {
    if (_noteCategory == 0) {
      notes[id].isFav = 1;
      dbHelper.updateNote(notes[id]);
      findAllNote();
    }
  }

  //tìm
  void findAllNote() async {
    final allRow = await dbHelper.findAllNote();
    notes.clear();
    notes = allRow
        .map((e) => Note.fromMap(e))
        .toList()
        .where((element) =>
            element.isTrash == 0 && element.isHidden == 0 && element.isFav == 0)
        .toList();
    notifyListeners();
  }

  void findTrashNote() async {
    final allRow = await dbHelper.findAllNote();
    notes.clear();
    notes = allRow
        .map((e) => Note.fromMap(e))
        .toList()
        .where((element) => element.isTrash == 1)
        .toList();
    notifyListeners();
  }

  void findHidNote() async {
    final allRow = await dbHelper.findAllNote();
    notes.clear();
    notes = allRow
        .map((e) => Note.fromMap(e))
        .toList()
        .where((element) => element.isHidden == 1)
        .toList();
    notifyListeners();
  }

  void findFavNote() async {
    final allRow = await dbHelper.findAllNote();
    notes.clear();
    notes = allRow
        .map((e) => Note.fromMap(e))
        .toList()
        .where((element) => element.isFav == 1)
        .toList();
    notifyListeners();
  }

  void swipeStartToEnd(int index) {
    if (noteCategory == 0) {
      moveToHide(index);
      findAllNote();
    }
    if (noteCategory == 1) {
      moveToAllNote(index);
      findFavNote();
    }
    if (noteCategory == 2) {
      moveToAllNote(index);
      findHidNote();
    }
    if (noteCategory == 3) {
      moveToAllNote(index);
      findTrashNote();
    }
  }

  void swipeEndToStart(int index) {
    if (noteCategory == 0) {
      moveToTrash(index);
      findAllNote();
    }
    if (noteCategory == 1) {
      moveToTrash(index);
      findFavNote();
    }
    if (noteCategory == 2) {
      moveToTrash(index);
      findHidNote();
    }
    if (noteCategory == 3) {
      dbHelper.deleteNote(notes[index].id);
      findTrashNote();
    }
  }

  void findAllWithCategory() {
    if (noteCategory == 0) {
      findAllNote();
    }
    if (noteCategory == 1) {
      findFavNote();
    }
    if (noteCategory == 2) {
      findHidNote();
    }
    if (noteCategory == 3) {
      findTrashNote();
    }
  }

  int get noteCategory => _noteCategory;

  set noteCategory(int value) {
    _noteCategory = value;
    notifyListeners();
  }

  void filterNotes(String text) {
    if (text.isNotEmpty) {
      notes = notes
          .where((element) =>
              element.title
                  .toString()
                  .trim()
                  .toLowerCase()
                  .contains(text.toString().trim().toLowerCase()) ||
              element.content
                  .toString()
                  .trim()
                  .toLowerCase()
                  .contains(text.toString().trim().toLowerCase()))
          .toList();
    } else {
      findAllWithCategory();
    }
    notifyListeners();
  }
}
