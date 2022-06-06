import 'package:flutter/material.dart';
import 'package:my_notes/models/note.dart';
import 'package:my_notes/widgets/card_note.dart';

import '../constants/app_colors.dart';

class NoteList extends StatefulWidget {
  var notes = <Note>[];

  @override
  State<StatefulWidget> createState() => _NoteListState();

  NoteList({Key? key, required this.notes}) : super(key: key);
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: CardNote(
          index: index + 2,
          title: widget.notes[index + 2].title,
          content: widget.notes[index + 2].content,
          stroke: AppColors.colorBluePrimary,
          background: Colors.white,
        ),
      ),
      itemCount: widget.notes.length - 2,
    );
  }
}
