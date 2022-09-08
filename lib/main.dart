import 'package:flutter/material.dart';
import 'package:todo_app/Home_Screen.dart';
import 'package:todo_app/Themes/my_themes.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "todo app",
      theme: MyThemes.lightTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(_) => HomeScreen()
      },

    );
  }
}
