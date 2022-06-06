import 'package:flutter/material.dart';
import 'package:my_notes/models/note.dart';
import 'package:my_notes/routes/introroutes/intro_sreen.dart';
import 'package:my_notes/routes/noteeditroutes/note_edit_screen.dart';

import 'homeroutes/home_screen.dart';

class AppRouter {
  static const homePage = '/';
  static const introPage = '/intro';
  static const noteEditPage = '/note-edit';

  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute<void>(builder: (_) => const HomeScreen());
      case introPage:
        return MaterialPageRoute<void>(builder: (_) => const IntroScreen());
      case noteEditPage:
        return MaterialPageRoute<void>(
          builder: (_) => NoteEditScreen(note: settings.arguments as Note),
        );
      default:
        throw const FormatException("Route not found");
    }
  }
}
