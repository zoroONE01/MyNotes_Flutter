import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class IntroTabIndicator extends StatelessWidget {
  const IntroTabIndicator({
    required this.tabNumber,
    Key? key,
  }) : super(key: key);
  final int tabNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(
            height: 5,
            decoration: BoxDecoration(
                color: tabNumber == 0
                    ? AppColors.colorBluePrimary
                    : AppColors.colorGrayPrimary,
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(
            height: 5,
            decoration: BoxDecoration(
                color: tabNumber == 1
                    ? AppColors.colorBluePrimary
                    : AppColors.colorGrayPrimary,
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Container(
            height: 5,
            decoration: BoxDecoration(
                color: tabNumber == 2
                    ? AppColors.colorBluePrimary
                    : AppColors.colorGrayPrimary,
                borderRadius: BorderRadius.circular(20)),
          ),
        )
      ],
    );
  }
}
