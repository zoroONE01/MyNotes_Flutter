import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_notes/constants/app_strings.dart';

import '../constants/app_colors.dart';
import '../constants/app_paths.dart';
import '../constants/app_text_styles.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppPaths.icBack,
          color: AppColors.colorBluePrimary,
          semanticsLabel: AppStrings.back,
          width: 12,
          height: 20.5,
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(
          AppStrings.back,
          style: AppTextStyles.topButton,
        )
      ],
    );
  }
}
