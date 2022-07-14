import 'package:flutter/material.dart';

class Note1 {
  int? id = 10;
  String title = "title";
  String content = 'content';
  bool isTrash = true;
  bool isFav = false;
  bool isHidden = true;

  void checkNote() {
    var item = Note1();
  }

  void nullCheck1(int? number) {
    id = number ?? 1;
  }

  void nullCheck2(Note1? note) {
    id = note?.id;
  }

  void concatArr() {
    var y = [4, 5, 6];
    var x = [1, 2, ...y];
  }

  void formatTitle() {
    String str = ' this is new string '
      ..toUpperCase()
      ..trim();
  }

  Widget getText(BuildContext context) =>
      isFav ? const Text("true") : const Text("false");
}
