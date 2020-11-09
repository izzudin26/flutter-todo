class Todo{
  String todoName;
  String status;
  DateTime duedate;

  Todo({this.todoName, this.duedate, this.status});

  factory Todo.fromJson(Map<String, dynamic> json){
    return Todo(
      todoName: json['todoname'],
      duedate: json['duedate'],
      status: json['status']
    );
  }

  Map<String, dynamic> toJson() => {
    "todoname": todoName,
    "duedate": duedate,
    "status": status
  };
}