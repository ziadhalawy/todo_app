import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Themes/my_themes.dart';
import 'package:todo_app/List%20Screen/task_widget.dart';

class ListTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 1560)),
            lastDate: DateTime.now().add(Duration(days: 1560)),
            onDateSelected: (date) => print(date),
            leftMargin: 30,
            monthColor: Colors.blueGrey,
            dayColor: MyThemes.blue,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.black12,
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => date.day != 0,
            locale: 'en_ISO',
          ),
          Expanded(
            child: Container(
              child: ListView.builder(itemBuilder: (_, index) {
                return TaskWidg();
              },itemCount: 10,
              ),
            ),
          )
        ],
      )
    );
  }
}
