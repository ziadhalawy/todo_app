import 'package:flutter/material.dart';
import 'package:todo_app/Themes/my_themes.dart';
import 'package:todo_app/List%20Screen/list_tab.dart';
import 'package:todo_app/settings_screen/settings_tab.dart';
import 'package:todo_app/List%20Screen/task_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "Home Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

// List<BottomNavigationBarItem> bottomItems = [ListTab(),settingsTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyThemes.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            side: BorderSide(color: Colors.white)),
        child: Icon(Icons.add),
        onPressed: () {},
      ),body: tabs[selectedIndex],
    );
  }

  var tabs = [ListTab(), settingsTab()];
}
