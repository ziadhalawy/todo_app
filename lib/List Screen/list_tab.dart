import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Themes/my_themes.dart';
import 'package:todo_app/List%20Screen/task_widget.dart';
import 'package:todo_app/dataBase/Task.dart';
import 'package:todo_app/dataBase/my_db.dart';

class ListTab extends StatefulWidget {
  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 1560)),
          lastDate: DateTime.now().add(Duration(days: 1560)),
          onDateSelected: (date) {
            if (date == null) return;
            setState(() {
              selectedDate = date;
            });
          },
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
          child:
              //FutureBuilder<QuerySnapshot<Task>>(builder: (context, snapshot) {
              StreamBuilder<QuerySnapshot<Task>>(
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('There was an error'
                          'Please try again later');
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    var data =
                        snapshot.data?.docs.map((e) => e.data()).toList();
                    //    List<Task> tasks = querySnapShot.docs.map((e) => e.data()).toList();

                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return TaskWidg(data![index]);
                      },
                      itemCount: data!.length,
                    );
                  },
                  stream:
                      MyDatabase.listenForRealTasksTimeUpdate(selectedDate)),
        ),
      ],
    ));
  }
}
