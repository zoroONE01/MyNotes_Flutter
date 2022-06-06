import 'package:flutter/material.dart';
import 'package:my_notes/constants/app_colors.dart';
import 'package:my_notes/constants/app_text_styles.dart';
import 'package:my_notes/providers/notes_provider.dart';
import 'package:provider/provider.dart';

import '../routes/app_router.dart';

class CardNote extends StatefulWidget {
  String? title;
  String content;
  final Color stroke;
  final Color background;
  final bool isVertical;
  final int index;

  CardNote(
      {Key? key,
      this.title,
      required this.content,
      required this.stroke,
      required this.background,
      this.isVertical = false,
      required this.index})
      : super(key: key);

  @override
  State<CardNote> createState() => _CardNoteState();
}

class _CardNoteState extends State<CardNote> {
  bool isCurrentlyTouching = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(
      builder: (context, value, child) => GestureDetector(
        onTapDown: (_) {
          setState(() {
            isCurrentlyTouching = true;
          });
        },
        onLongPressDown: (_) {
          setState(() {
            isCurrentlyTouching = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            isCurrentlyTouching = false;
          });
        },
        onLongPressUp: () {
          setState(() {
            isCurrentlyTouching = false;
          });
        },
        onLongPressCancel: () {
          setState(() {
            isCurrentlyTouching = false;
          });
        },
        onDoubleTap: () => value.moveToFav(widget.index),
        onTap: () => value.noteCategory != 3
            ? Navigator.pushNamed(context, AppRouter.noteEditPage,
                arguments: value.notes[widget.index])
            : null,
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: !isCurrentlyTouching
                      ? Colors.transparent
                      : (value.noteCategory == 0
                          ? AppColors.colorAllNoteSelected
                          : (value.noteCategory == 1
                              ? AppColors.colorFavNoteSelected
                              : (value.noteCategory == 2
                                  ? AppColors.colorHidNoteSelected
                                  : AppColors.colorTrashNoteSelected)))),
              borderRadius: BorderRadius.circular(10),
              color: value.noteCategory == 0
                  ? AppColors.colorBackgroundAllNote
                  : (value.noteCategory == 1
                      ? AppColors.colorBackgroundFavNote
                      : (value.noteCategory == 2
                          ? AppColors.colorBackgroundHidNote
                          : AppColors.colorBackgroundTrashNote)),
            ),
            padding: const EdgeInsets.all(15),
            height: widget.isVertical ? 198 : 96,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.title ?? 'No title',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTextStyles.h5,
              ),
              Container(
                height: 0.2,
                margin: const EdgeInsets.symmetric(vertical: 5),
                color: AppColors.colorTextSecondary,
              ),
              Text(
                widget.content,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: widget.isVertical ? 8 : 2,
              ),
            ])),
      ),
    );
  }
}
