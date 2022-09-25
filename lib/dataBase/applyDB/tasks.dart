class tasks {
  String? id;
  String? description;
  bool? isDone;
  DateTime? date;
  tasks({
    this.id,
    this.description,
    this.date,
    this.isDone,
  });
  tasks.fromFileStore(Map<String,dynamic> dataa)
      :this(
        id:dataa['id'],
        isDone:dataa['isDone'],
        description:dataa['description'],
        date:DateTime.fromMillisecondsSinceEpoch(dataa['date']),
      );
  Map<String,dynamic> toFileStore(){
    return{
      'id': id,
      'isDone': isDone,
      'description':description,
      'date':date?.millisecondsSinceEpoch
    };
  }


}
