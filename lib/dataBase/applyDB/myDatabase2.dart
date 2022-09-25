import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/dataBase/applyDB/tasks.dart';

class myDAtabase {
  static const collectionName = 'db';
  static CollectionReference<tasks> getCollection() {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter<tasks>(
      fromFirestore: (snapshot, options) {
        return tasks.fromFileStore(snapshot.data()!);
      },
      toFirestore: (tasks, options) {
        return tasks.toFileStore();
      },
    );
  }

  void insertTask(tasks task) {
    var collectionDoc = getCollection();
    var doc = collectionDoc.doc();
    task.id = doc.id;
    doc.set(task);
  }
}
