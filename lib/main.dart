import 'package:flutter/material.dart';
import 'package:my_notes/providers/bot_nav_provider.dart';
import 'package:my_notes/providers/notes_provider.dart';
import 'package:my_notes/providers/tab_counter_provider.dart';
import 'package:my_notes/routes/app_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  const MyApp({Key? key}) : super(key: key);
}

class _MyAppState extends State<MyApp> {
  Future<bool> checkLoginValue() async {
    SharedPreferences firstInstallCheck = await SharedPreferences.getInstance();
    bool check = firstInstallCheck.getBool("isFirstInstall") ?? true;
    if(check){
      firstInstallCheck.setBool("isFirstInstall", false);
    }
    return check;
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(initRoute);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabCounterProvider()),
        ChangeNotifierProvider(create: (context) => BotNavProvider()),
        ChangeNotifierProvider(create: (context) => NotesProvider()),
      ],
      child: FutureBuilder<bool>(
          future: checkLoginValue(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) =>
              MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'My Notes',
                  initialRoute: snapshot.data == true ? AppRouter.introPage : AppRouter.homePage,
                  onGenerateRoute: AppRouter.generateRoute),

          ),
    );
  }
}
