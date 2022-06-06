import 'package:flutter/material.dart';
import 'package:my_notes/constants/app_colors.dart';
import 'package:my_notes/constants/app_paths.dart';
import 'package:my_notes/constants/app_strings.dart';
import 'package:my_notes/constants/app_text_styles.dart';
import 'package:my_notes/routes/app_router.dart';
import 'package:my_notes/widgets/button_intro.dart';
import 'package:provider/provider.dart';

import '../../providers/tab_counter_provider.dart';
import '../../widgets/button_back.dart';
import '../../widgets/tab_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  static const List<Widget> introTabs = <IntroTab>[
    IntroTab(
        buttonRightText: AppStrings.skip,
        buttonText: AppStrings.next,
        title: AppStrings.splash1Title,
        desc: AppStrings.splash1Desc,
        imgPath: AppPaths.imgIntro1),
    IntroTab(
        buttonLeftText: AppStrings.back,
        buttonRightText: AppStrings.skip,
        buttonText: AppStrings.next,
        title: AppStrings.splash2Title,
        desc: AppStrings.splash2Desc,
        imgPath: AppPaths.imgIntro2),
    IntroTab(
        buttonLeftText: AppStrings.back,
        buttonText: AppStrings.getStarted,
        title: AppStrings.splash3Title,
        desc: AppStrings.splash3Desc,
        imgPath: AppPaths.imgIntro3)
  ];

  // late TabController _introTabController;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _introTabController = TabController(vsync: this, length: introTabs.length);
  // }
  //
  // @override
  // void dispose() {
  //   _introTabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: introTabs.length,
        child: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: introTabs,
        ),
      ),
    );
  }
}

class IntroTab extends StatefulWidget {
  final String buttonText;
  final String title;
  final String desc;
  final String imgPath;
  final String buttonLeftText;
  final String buttonRightText;

  @override
  State<IntroTab> createState() => _IntroTabState();

  const IntroTab(
      {Key? key,
      required this.buttonText,
      required this.title,
      required this.desc,
      required this.imgPath,
      this.buttonRightText = '',
      this.buttonLeftText = ''})
      : super(key: key);

// const IntroTab.withLeft(
//     {required this.buttonText, required this.title, required this.desc, required this.imgPath,, required this.ButtonLeftText});
//
// const IntroTab.withRight(
//     {required this.buttonText, required this.title, required this.desc, required this.imgPath,
//       required this.ButtonRightText, required this.ButtonLeftText});

}

class _IntroTabState extends State<IntroTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabCounterProvider>(
        builder: (context, value, child) => Stack(
              alignment: Alignment.topCenter,
              fit: StackFit.passthrough,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => DefaultTabController.of(context)
                            ?.animateTo(value.decrement()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Visibility(
                                visible: widget.buttonLeftText.isNotEmpty,
                                child: const ButtonBack()),
                            GestureDetector(
                              // onTap: () => value.toLastPage(),
                              onTap: () => DefaultTabController.of(context)
                                  ?.animateTo(value.toLastPage()),
                              child: Visibility(
                                visible: widget.buttonRightText.isNotEmpty,
                                child: Text(
                                  widget.buttonRightText,
                                  style: AppTextStyles.topButton,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: const Alignment(0, -.7),
                          heightFactor: 304,
                          child: ClipRect(child: Image.asset(widget.imgPath)),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 420,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.colorBackgroundSecondary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 2.0,
                            color: Color.fromRGBO(0, 0, 0, 0.2)),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 40, 30, 50),
                      child: Consumer<TabCounterProvider>(
                        builder: (context, value, child) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  IntroTabIndicator(
                                      tabNumber: value.currentCount),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    widget.title,
                                    style: AppTextStyles.h1,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    widget.desc,
                                    style: AppTextStyles.body1,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                              Expanded(
                                  child: Container(
                                alignment: const Alignment(0, .5),
                                child: GestureDetector(
                                    onTap: () => value.currentCount < 2
                                        ? DefaultTabController.of(context)
                                            ?.animateTo(value.increment())
                                        : Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            AppRouter.homePage,
                                            (router) => false),
                                    child:
                                        ButtonIntro(title: widget.buttonText)),
                              )),
                            ]),
                      ),
                    ),
                  ),
                )
              ],
            ));
  }
}
