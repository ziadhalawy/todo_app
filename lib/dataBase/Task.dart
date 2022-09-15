class Task{
  static const collectionName = 'tasks';
  String? id;
  String? description;
  String? title;
  DateTime? dateTime;
  bool? isDone;
  Task({
    this.id,
    this.title,
    this.description,
    this.dateTime,
    this.isDone,}
  );
  Task.fromFileStore(Map<String,dynamic> data)
      :this(
    id:data["id"],
    title:data["title"],
    description:data["description"],
    dateTime:DateTime.fromMillisecondsSinceEpoch(data["dateTime"]),
    isDone:data["isDone"],
  );
  Map<String,dynamic> toFileStore(){
    return{
      'id':id,
      'title':title,
      'description':description,
      'isDone':isDone,
      'dateTime':dateTime?.millisecondsSinceEpoch
    };
  }
}