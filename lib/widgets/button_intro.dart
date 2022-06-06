import 'package:flutter/material.dart';
import 'package:my_notes/constants/app_colors.dart';
import 'package:my_notes/constants/app_text_styles.dart';

class ButtonIntro extends StatelessWidget {
  final String title;

  const ButtonIntro({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Ink(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
              color: AppColors.colorBluePrimary,
              borderRadius: BorderRadius.circular(14)),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.buttonIntro,
            ),
          ),
        ),
      ),
    );
  }
}
