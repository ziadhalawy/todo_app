import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Home_Screen.dart';
import 'package:todo_app/Themes/my_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//
void main()
async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  //if you want to use firebase locally
  //FirebaseFirestore.instance.disableNetwork();
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
