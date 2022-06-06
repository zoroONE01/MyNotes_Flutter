import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_notes/constants/app_text_styles.dart';
import 'package:my_notes/providers/notes_provider.dart';
import 'package:provider/provider.dart';

class ToggleButtonCategory extends StatefulWidget {
  final String title;
  final String iconPath;
  final Color colorSelected;
  final int id;

  const ToggleButtonCategory(
      {Key? key,
      required this.title,
      required this.id,
      required this.iconPath,
      required this.colorSelected})
      : super(key: key);

  @override
  State<ToggleButtonCategory> createState() => _ToggleButtonCategoryState();
}

class _ToggleButtonCategoryState extends State<ToggleButtonCategory> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Selector<NotesProvider, int>(
      selector: (p0, p1) => p1.noteCategory,
      builder: (context, value, child) => Container(
        height: 50,
        decoration: BoxDecoration(
            color: value == widget.id ? widget.colorSelected : Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 15,
            ),
            SvgPicture.asset(
              widget.iconPath,
              width: 32,
              height: 32,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.title,
              style:
                  value == widget.id ? AppTextStyles.h5White : AppTextStyles.h5,
            )
          ],
        ),
      ),
    );
  }
}
