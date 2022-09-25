import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/FeedBack%20Messenger.dart';
import 'package:todo_app/Themes/my_themes.dart';
import 'package:todo_app/dataBase/my_db.dart';

import '../dataBase/Task.dart';

class TaskWidg extends StatelessWidget {
  Task task;
  TaskWidg(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 8, 10, 8),
      child: Slidable(
        startActionPane: ActionPane(motion: ScrollMotion(), children: [
          SlidableAction(
            onPressed: (_) {
              MyDatabase.deleteTask(task).
              then((value) {
                MessageFeedback(context, 'Data deleted Successfully',
                  posBtnName: 'ok',posFunction: () {
                },);
              },).
              onError((error, stackTrace){
                MessageFeedback(context, 'Something went wrong',posFunction: () {
                },posBtnName: 'cancel');
              }).timeout(
                onTimeout: () {
                  MessageFeedback(context, 'The record deleted locally',
                    posBtnName: 'ok',posFunction: () {
                  },);
                },
                  Duration(seconds: 5));
              },
            icon: Icons.delete,
            backgroundColor: MyThemes.red,
            borderRadius: BorderRadius.circular(15),
            label: 'Remove',
            foregroundColor: Colors.white,
            autoClose: true,
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  height: 80,
                  width: 6,
                  decoration: BoxDecoration(
                      color: MyThemes.blue,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Expanded(
                child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title ??= "",
                      style: TextStyle(
                          color: MyThemes.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    SizedBox(height: 15,)
                    ,
                    Text(
                      task.description ??= "",
                      style: TextStyle(fontSize: 15),
                    ),SizedBox(height: 10,)
                    ,
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.grey[600],
                        ),
                        Text(
                          '10:30',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(onTap: () {}, child: Icon(Icons.checklist))
            ],
          ),
        ),
      ),
    );
  }
}
