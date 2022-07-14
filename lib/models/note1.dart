import 'package:flutter/material.dart';
import 'package:my_notes/models/note.dart';

class Note1 {
  int? id = 10;
  var title = "title";
  var content = 'content';
  var isTrash = true;
  var isFav = false;
  var isHidden = true;

  void checkNote() {
    var item = Note1();
  }
  void nullCheck1(int? number){
    id = number == null ? 1 : 2;
  }

  void nullCheck2(Note1? note){
    id = note == null ? null : note.id;
  }

  void concatArr(){
    var y = [4,5,6];
    var x = [1,2];
    x.addAll(y);
  }

  void formatTitle(){
    title.trim();
    title.toUpperCase();
  }

  Widget getText(BuildContext context){
    return isFav ? const Text("true"): const Text("false");
  }
}
