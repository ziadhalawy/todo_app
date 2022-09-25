import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/text_form_field.dart';
import 'package:todo_app/DateUtil.dart';
import 'package:todo_app/FeedBack%20Messenger.dart';
import 'package:todo_app/dataBase/Task.dart';
import 'package:todo_app/dataBase/applyDB/tasks.dart';
import 'package:todo_app/dataBase/my_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class addTaskBottomSheet extends StatefulWidget {
  @override
  State<addTaskBottomSheet> createState() => _addTaskBottomSheetState();
}

class _addTaskBottomSheetState extends State<addTaskBottomSheet> {
  static final glopalKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .7,
      alignment: Alignment.centerLeft,
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Form(
        key: glopalKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Add new task',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: titleController,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'Please Enter title';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextFormField(
              controller: descController,
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'Please Enter description';
                }
                return null;
              },
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                'Pick a date',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            InkWell(
              onTap: () {
                return datePicker();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Center(
                  child: Text(
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  addTask();
                },
                child: Text('Insert Task'))
          ],
        ),
      ),
    );
  }

  var selectedDate = DateTime.now();

  void datePicker() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  void addTask() {
    if (glopalKey.currentState?.validate() == true) {
      String title = titleController.text;
      String desc = descController.text;
      Task task = Task(
        description: desc,
        title: title,
        dateTime:  dateOnly(selectedDate),
        isDone: false,
      );
      loadingCircular(context, 'Loading...', isCancelable: false);
      MyDatabase.insertTask(task).
      then((value) {
        hideLoading(context);
        MessageFeedback(
          context,
          "Your record Saved Saccessfully",
          posBtnName: 'ok',
          posFunction: () {
            Navigator.pop(context);
          },
        );
      }).onError(
        (error, stackTrace) {
          hideLoading(context);
        },
      ).timeout(onTimeout: () {
        hideLoading(context);
      }, Duration(seconds: 5));
    }
  }
}
