import 'package:flutter/material.dart';
import 'package:my_notes/data/local/database_helper.dart';
import 'package:my_notes/widgets/button_back.dart';
import 'package:provider/provider.dart';

import '/models/note.dart';
import '/providers/bot_nav_provider.dart';
import '/providers/notes_provider.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../constants/app_text_styles.dart';

class NoteEditScreen extends StatefulWidget {
  NoteEditScreen({Key? key, required this.note}) : super(key: key);
  Note note;

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  final dbHelper = DatabaseHelper.instance;
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //
  // void _insertNote(String title, String content) async {
  //   // row to insert
  //   final row = <String, dynamic>{
  //     DatabaseHelper.clTitle: title,
  //     DatabaseHelper.clContent: content
  //   };
  //   Note note = Note.fromMap(row);
  //   final status = await dbHelper.insertNote(note);
  // }
  //
  // void _updateNote(int id, String title, String content) async {
  //   Note note = Note(id, title, content);
  //   final status = await dbHelper.updateNote(note);
  // }
  //
  // void _deleteNote(int id) async {
  //   final status = await dbHelper.deleteNote(id);
  // }

  @override
  void initState() {
    super.initState();
    if (widget.note.id == -1) {
      contentController.text = '';
      titleController.text = '';
    } else {
      contentController.text = widget.note.content;
      titleController.text = widget.note.title!;
    }
  }

  @override
  void dispose() {
    contentController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(23, 23, 23, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Consumer<BotNavProvider>(
                  builder: (context, tabNumber, child) => Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            tabNumber.counter = 0;
                            Navigator.pop(context);
                          },
                          child: const ButtonBack()),
                      InkWell(
                        child: GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if (widget.note.id == -1) {
                                value.insertNote(titleController.text,
                                    contentController.text);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Lưu thành công")),
                                );
                                value.noteCategory = 0;
                                value.findAllWithCategory();
                                tabNumber.counter = 0;
                                Navigator.pop(context);
                              } else {
                                value.updateNote(
                                    widget.note.id,
                                    titleController.text,
                                    contentController.text,
                                    widget.note);
                                value.findAllWithCategory();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Cập nhật thành công")));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Lỗi")),
                              );
                            }
                          },
                          child: Ink(
                            height: 35,
                            width: 70,
                            decoration: BoxDecoration(
                                color: AppColors.colorButtonSecondary,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                AppStrings.save,
                                style: AppTextStyles.bodySave,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: titleController,
                  minLines: 1,
                  maxLines: 3,
                  style: AppTextStyles.h2,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(style: BorderStyle.none, width: 0)),
                    hintText: AppStrings.pageTitle,
                    hintStyle: AppTextStyles.h2Hint,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) =>
                        value == null || value.isEmpty ? '' : null,
                    controller: contentController,
                    // initialValue: note.id == -1 ? '' : note.content,
                    maxLines: 100,
                    style: AppTextStyles.body0,
                    decoration: const InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(style: BorderStyle.none, width: 0)),
                      hintText: AppStrings.noteHere,
                      hintStyle: AppTextStyles.body0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
