import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/Themes/my_themes.dart';

class TaskWidg extends StatefulWidget {
  @override
  State<TaskWidg> createState() => _TaskWidgState();
}

class _TaskWidgState extends State<TaskWidg> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 8, 10, 8),

      child: Slidable(
        startActionPane: ActionPane(
            motion:ScrollMotion() ,
            children: [
          SlidableAction(onPressed: (context) {

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
                child: Column(
                  children: [
                    Text(
                      "This is the title",
                      style: TextStyle(
                          color: MyThemes.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
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
              InkWell(
                onTap: () {

                },
                  child: Icon(Icons.checklist))
            ],
          ),
        ),
      ),
    );
  }
}
