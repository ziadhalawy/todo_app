import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/DateUtil.dart';

import 'Task.dart';

class MyDatabase {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(
      fromFirestore: (snapshot, options) {
        return Task.fromFileStore(snapshot.data()!);
      },
      toFirestore: (task, options) {
        return task.toFileStore();
      },
    );
  }

  static Future<void> insertTask(Task task) {
    var taskCollection = getTasksCollection();
    var taskDoc = taskCollection.doc();
    task.id = taskDoc.id;
    return taskDoc.set(task);
  }

  static Future<QuerySnapshot<Task>> getAllTask(DateTime selectedDate) async {
    QuerySnapshot<Task> querySnapShot = await getTasksCollection().
    where('dateTime',isEqualTo:dateOnly(selectedDate).millisecondsSinceEpoch )
        .get();
    //List<Task> tasks = querySnapShot.docs.map((e) => e.data()).toList();
    return querySnapShot;
  }
  static Future<void> deleteTask(Task task) {
    var taskDoc = getTasksCollection().doc(task.id);
    return taskDoc.delete();
  }
  static Stream<QuerySnapshot<Task>> listenForRealTasksTimeUpdate(DateTime selectedDate) {
    return getTasksCollection().
    where('dateTime',
        isEqualTo: dateOnly(selectedDate).millisecondsSinceEpoch)
        .snapshots();
  }
}
