import 'package:flutter/material.dart';
import 'package:my_notes/providers/bot_nav_provider.dart';
import 'package:my_notes/providers/notes_provider.dart';
import 'package:my_notes/providers/tab_counter_provider.dart';
import 'package:my_notes/routes/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabCounterProvider()),
        ChangeNotifierProvider(create: (context) => BotNavProvider()),
        ChangeNotifierProvider(create: (context) => NotesProvider()),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Notes',
          initialRoute: AppRouter.homePage,
          onGenerateRoute: AppRouter.generateRoute),
    );
  }
}
