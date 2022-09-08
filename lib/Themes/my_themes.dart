import 'package:flutter/material.dart';

class MyThemes {
  static final Color blue = Color(0XFF5D9CEC);
  static final Color lightPrimary = Color(0XFFDFECDB);
  static final Color green = Color(0XFF61E757);
  static final Color red = Color(0XFFEC4B4B);
  static final Color grey = Color(0XFFC8C9CB);
  static final ThemeData lightTheme = ThemeData(
    primaryColor: MyThemes.blue,
      scaffoldBackgroundColor: MyThemes.lightPrimary,
      appBarTheme:
      AppBarTheme(
        centerTitle: true,
        backgroundColor: MyThemes.blue,
        elevation: 0,
      ),
          bottomNavigationBarTheme:BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(color: MyThemes.blue,size: 35),
            selectedLabelStyle: TextStyle(color: MyThemes.blue,fontSize: 15,),
            unselectedIconTheme: IconThemeData(color: MyThemes.grey,size: 35),
            unselectedLabelStyle:TextStyle(color: MyThemes.grey,fontSize: 15,)
          )



  );
}
