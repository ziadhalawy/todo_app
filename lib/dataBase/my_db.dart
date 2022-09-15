import 'package:cloud_firestore/cloud_firestore.dart';

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

  void insertTask(Task task) {
    var taskCollection = getTasksCollection();
    var taskDoc = taskCollection.doc();
    task.id = taskDoc.id;
    taskDoc.set(task);
  }
}
