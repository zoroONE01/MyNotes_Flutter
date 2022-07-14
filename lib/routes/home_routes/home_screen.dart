import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_notes/Utils/datetime_util.dart';
import 'package:my_notes/constants/app_colors.dart';
import 'package:my_notes/constants/app_paths.dart';
import 'package:my_notes/constants/app_strings.dart';
import 'package:my_notes/constants/app_text_styles.dart';
import 'package:my_notes/models/note.dart';
import 'package:my_notes/providers/notes_provider.dart';
import 'package:my_notes/widgets/bot_nav_bar.dart';
import 'package:my_notes/widgets/card_note.dart';
import 'package:my_notes/widgets/toggle_button_category.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tfSearch = TextEditingController();
  var notesFilter = <Note>[];

  // final notes = <Note>[];
  // DatabaseHelper dbHelper = DatabaseHelper.instance;

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
  //
  // void _findALlNote() async {
  //   final allRow = await dbHelper.findAllNote();
  //   notes.clear();
  //   for (var e in allRow) {
  //     notes.add(Note.fromMap(e));
  //     // print(e.values);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // var provider = Provider.of<NotesProvider>(context);
    // tfSearch.addListener(() {
    //   notesFilter = provider.notes.where((element) => tfSearch.text.toLowerCase().contains(element.title.toString()) && tfSearch.text.toLowerCase().contains(element.content.toString())).toList();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).size.width * 0.05;
    // final noteProvider = Provider.of<NotesProvider>(context);
    // noteProvider.findALlNote();
    return Scaffold(
      backgroundColor: AppColors.colorBackgroundPrimary,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(padding, padding, padding, 0),
        // padding: const EdgeInsets.fromLTRB(23, 23, 23, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const HomeTabBar(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Consumer<NotesProvider>(
                builder: (context, value, child) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const NoteCategory(),
                        value.notes.isEmpty
                            ? const Center(child: Text('No data...'))
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Dismissible(
                                          key: UniqueKey(),
                                          onDismissed: (direction) {
                                            if (direction ==
                                                DismissDirection.startToEnd) {
                                              value.swipeStartToEnd(0);
                                            }
                                            if (direction ==
                                                DismissDirection.endToStart) {
                                              value.swipeEndToStart(0);
                                            }
                                          },
                                          background: Container(
                                            color: value.noteCategory != 0
                                                ? AppColors.colorAllNoteSelected
                                                : AppColors
                                                    .colorHidNoteSelected,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                SvgPicture.asset(
                                                  value.noteCategory != 0
                                                      ? AppPaths.icAllNote
                                                      : AppPaths.icHidden,
                                                  width: 32,
                                                  height: 32,
                                                ),
                                                Text(
                                                  value.noteCategory != 0
                                                      ? '${value.noteCategory + value.noteCategory}'
                                                      : 'Move to Hide',
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          secondaryBackground: Container(
                                            color: AppColors
                                                .colorTrashNoteSelected,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  value.noteCategory != 3
                                                      ? 'Move to Trash'
                                                      : 'Delete Note',
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                SvgPicture.asset(
                                                  AppPaths.icTrash,
                                                  width: 32,
                                                  height: 32,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                          child: CardNote(
                                              index: 0,
                                              title: value.notes[0].title,
                                              content: value.notes[0].content,
                                              stroke:
                                                  AppColors.colorBluePrimary,
                                              background: Colors.white,
                                              isVertical: true),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: value.notes.length > 1
                                            ? Dismissible(
                                                key: UniqueKey(),
                                                onDismissed: (direction) {
                                                  if (direction ==
                                                      DismissDirection
                                                          .startToEnd) {
                                                    value.swipeStartToEnd(1);
                                                  }
                                                  if (direction ==
                                                      DismissDirection
                                                          .endToStart) {
                                                    value.swipeEndToStart(1);
                                                  }
                                                },
                                                background: Container(
                                                  color: value.noteCategory != 0
                                                      ? AppColors
                                                          .colorAllNoteSelected
                                                      : AppColors
                                                          .colorHidNoteSelected,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      SvgPicture.asset(
                                                        value.noteCategory != 0
                                                            ? AppPaths.icAllNote
                                                            : AppPaths.icHidden,
                                                        width: 32,
                                                        height: 32,
                                                      ),
                                                      Text(
                                                        value.noteCategory != 0
                                                            ? 'Return All Note'
                                                            : 'Move to Hide',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                secondaryBackground: Container(
                                                  color: AppColors
                                                      .colorTrashNoteSelected,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        value.noteCategory != 3
                                                            ? 'Move to Trash'
                                                            : 'Delete Note',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      SvgPicture.asset(
                                                        AppPaths.icTrash,
                                                        width: 32,
                                                        height: 32,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                child: CardNote(
                                                    index: 1,
                                                    title: value.notes[1].title,
                                                    content:
                                                        value.notes[1].content,
                                                    stroke: AppColors
                                                        .colorBluePrimary,
                                                    background: Colors.white,
                                                    isVertical: true),
                                              )
                                            : const Placeholder(
                                                color: Colors.transparent,
                                                fallbackHeight: 198,
                                              ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  value.notes.length > 2
                                      ? ListView.builder(
                                          primary: false,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Dismissible(
                                              key: UniqueKey(),
                                              onDismissed: (direction) {
                                                if (direction ==
                                                    DismissDirection
                                                        .startToEnd) {
                                                  value.swipeStartToEnd(index);
                                                }
                                                if (direction ==
                                                    DismissDirection
                                                        .endToStart) {
                                                  value.swipeEndToStart(index);
                                                }
                                              },
                                              background: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                color: value.noteCategory != 0
                                                    ? AppColors
                                                        .colorAllNoteSelected
                                                    : AppColors
                                                        .colorHidNoteSelected,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    SvgPicture.asset(
                                                      value.noteCategory != 0
                                                          ? AppPaths.icAllNote
                                                          : AppPaths.icHidden,
                                                      width: 32,
                                                      height: 32,
                                                    ),
                                                    Text(
                                                      value.noteCategory != 0
                                                          ? 'Move to All Note'
                                                          : 'Move to Hide',
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              secondaryBackground: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                color: AppColors
                                                    .colorTrashNoteSelected,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      value.noteCategory != 3
                                                          ? 'Move to Trash'
                                                          : 'Delete Note',
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    SvgPicture.asset(
                                                      AppPaths.icTrash,
                                                      width: 32,
                                                      height: 32,
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                child: CardNote(
                                                  index: index + 2,
                                                  title: value
                                                      .notes[index + 2].title,
                                                  content: value
                                                      .notes[index + 2].content,
                                                  stroke: AppColors
                                                      .colorBluePrimary,
                                                  background: Colors.white,
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount: value.notes.length - 2,
                                        )
                                      : const Placeholder(
                                          color: Colors.transparent,
                                          fallbackHeight: 0,
                                        ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: const BotNavBar(),
    );
  }
}

class NoteCategory extends StatefulWidget {
  @override
  State<NoteCategory> createState() => _NoteCategoryState();

  const NoteCategory();
}

class _NoteCategoryState extends State<NoteCategory> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(
      builder: (context, value, child) => Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    value.findAllNote();
                    value.noteCategory = 0;
                  },
                  child: const ToggleButtonCategory(
                      id: 0,
                      title: AppStrings.allNote,
                      iconPath: AppPaths.icAllNote,
                      colorSelected: AppColors.colorAllNoteSelected),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    value.findFavNote();
                    value.noteCategory = 1;
                  },
                  child: const ToggleButtonCategory(
                      id: 1,
                      title: AppStrings.favourites,
                      iconPath: AppPaths.icFav,
                      colorSelected: AppColors.colorFavNoteSelected),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    value.findHidNote();
                    value.noteCategory = 2;
                  },
                  child: const ToggleButtonCategory(
                      id: 2,
                      title: AppStrings.hidden,
                      iconPath: AppPaths.icHidden,
                      colorSelected: AppColors.colorHidNoteSelected),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    value.findTrashNote();
                    value.noteCategory = 3;
                  },
                  child: const ToggleButtonCategory(
                      id: 3,
                      title: AppStrings.trash,
                      iconPath: AppPaths.icTrash,
                      colorSelected: AppColors.colorTrashNoteSelected),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.recentNotes,
                style: AppTextStyles.h4,
              )),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  var tfSearchFocus = FocusNode();
  var tfSearchController = TextEditingController();

  @override
  void initState() {
    // tfSearchFocus.addListener(() {
    //   if (tfSearchFocus.hasFocus) {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var provider = Provider.of<NotesProvider>(context, listen: false);
      tfSearchController.addListener(() {
        // print(tfSearchController.text);
        provider.filterNotes(tfSearchController.text);
      });
    });
  }
  @override
  void dispose() {
    tfSearchController.dispose();
    tfSearchFocus.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  DatetimeUtil.getCurrentDate(),
                  style: AppTextStyles.body2,
                ),
                const Text(
                  AppStrings.notes,
                  style: AppTextStyles.h2,
                )
              ],
            ),
            SvgPicture.asset(
              AppPaths.icMore,
              width: 22,
              height: 22,
            )
          ],
        ),
        const SizedBox(
          height: 11,
        ),
        TextField(
          controller: tfSearchController,
          focusNode: tfSearchFocus,
          // autofocus: true,
          style: AppTextStyles.body1,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(style: BorderStyle.none, width: 0)),
              fillColor: Colors.white,
              filled: true,
              hintText: AppStrings.search,
              hintStyle: AppTextStyles.body4,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 6)),
        ),
        // const SizedBox(
        //   height: 20,
        // ),
      ],
    );
  }
}
