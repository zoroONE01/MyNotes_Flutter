import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_notes/constants/app_paths.dart';
import 'package:my_notes/providers/bot_nav_provider.dart';
import 'package:my_notes/routes/app_router.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../constants/app_text_styles.dart';
import '../models/note.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BotNavProvider>(
      builder: (context, value, child) => Container(
        height: 80,
        color: AppColors.colorBackgroundSecondary,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          GestureDetector(
            onTap: () => value.counter = 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Opacity(
                  opacity: value.currentCount == 0 ? 1 : 0,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 17, top: 1),
                    height: 2,
                    width: 35,
                    color: AppColors.colorTextSecondary,
                  ),
                ),
                SvgPicture.asset(AppPaths.icNotes,
                    color: value.currentCount == 0
                        ? AppColors.colorBluePrimary
                        : AppColors.colorTextPrimary),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  AppStrings.notes,
                  style: value.currentCount == 0
                      ? AppTextStyles.labelBotNavSelected
                      : AppTextStyles.labelBotNav,
                )
              ],
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     value.counter = 1;
          //   },
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Opacity(
          //         opacity: value.currentCount == 1 ? 1 : 0,
          //         child: Container(
          //           margin: const EdgeInsets.only(bottom: 19, top: 1),
          //           height: 2,
          //           width: 35,
          //           color: AppColors.colorTextSecondary,
          //         ),
          //       ),
          //       SvgPicture.asset(AppPaths.icEvents,
          //           color: value.currentCount == 1
          //               ? AppColors.colorBluePrimary
          //               : AppColors.colorTextPrimary),
          //       const SizedBox(
          //         height: 4,
          //       ),
          //       Text(
          //         AppStrings.events,
          //         style: value.currentCount == 1
          //             ? AppTextStyles.labelBotNavSelected
          //             : AppTextStyles.labelBotNav,
          //       )
          //     ],
          //   ),
          // ),
          // GestureDetector(
          //   // onTap: (){
          //   // },
          //   onTapDown: (_) => value.counter = 2,
          //   onTapUp: (_) => value.returnTab(),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Opacity(
          //         opacity: value.currentCount == 2 ? 1 : 0,
          //         child: Container(
          //           margin: const EdgeInsets.only(bottom: 19, top: 1),
          //           height: 2,
          //           width: 35,
          //           color: AppColors.colorTextSecondary,
          //         ),
          //       ),
          //       SvgPicture.asset(AppPaths.icSearch,
          //           color: value.currentCount == 2
          //               ? AppColors.colorBluePrimary
          //               : AppColors.colorTextPrimary),
          //       const SizedBox(
          //         height: 3,
          //       ),
          //       Text(
          //         AppStrings.search,
          //         style: value.currentCount == 2
          //             ? AppTextStyles.labelBotNavSelected
          //             : AppTextStyles.labelBotNav,
          //       )
          //     ],
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              value.counter = 3;
              Navigator.pushNamed(context, AppRouter.noteEditPage, arguments: Note());
              // Navigator.of(context, rootNavigator: true)
              //     .pushNamed(AppRouter.noteEditPage);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Opacity(
                  opacity: value.currentCount == 3 ? 1 : 0,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 17, top: 1),
                    height: 2,
                    width: 35,
                    color: AppColors.colorTextSecondary,
                  ),
                ),
                SvgPicture.asset(AppPaths.icCreateNote,
                    color: value.currentCount == 3
                        ? AppColors.colorBluePrimary
                        : AppColors.colorTextPrimary),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  AppStrings.createNote,
                  style: value.currentCount == 3
                      ? AppTextStyles.labelBotNavSelected
                      : AppTextStyles.labelBotNav,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
