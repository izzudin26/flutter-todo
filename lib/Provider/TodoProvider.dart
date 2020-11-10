import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:todolist/Models/Todo.dart';
import 'package:localstorage/localstorage.dart';

class TodoProvider extends ChangeNotifier {

  TodoProvider(){
    if(_task == null){
      getTask();
    }
  }

  String todoname;
  String duedate;

  LocalStorage storage = new LocalStorage("todolist");

  List<Todo> _task;
  List<Todo> get uncompleteTask => _task != null
      ? _task.where((element) => element.status == "uncomplete").toList()
      : _task;

  List<Todo> get recentTask => _task != null
      ? _task.where((element) => element.status != "uncomplete").toList()
      : _task;

  void setDuedate(String newDueDate) {
    this.duedate = newDueDate;
    notifyListeners();
  }

  Future<void> getTask() async {
    print("get task");
    String taskStorage = await storage.getItem("task");
    print(_task);
    if (_task == null) {
      _task = List<Todo>();
    } else {
      var json = jsonDecode(taskStorage) as List;
      _task = json.map((e) => Todo.fromJson(e)).toList();
    }
    notifyListeners();
  }

  void addTask() {
    print("hit task");
    Todo newTodo = Todo(
        status: "uncomplete", duedate: duedate.toString(), todoName: todoname);
    _task.add(newTodo);
    List<Map<String, dynamic>> newJsonTask =
        _task.map((e) => e.toJson()).toList();
    String storedJsonTask = jsonEncode(newJsonTask);
    storage.setItem("task", storedJsonTask);
    print(_task.length);
    notifyListeners();
  }

  void removeTask(int index) {
    _task.removeAt(index);
    List<Map<String, dynamic>> newJsonTask =
        _task.map((e) => e.toJson()).toList();
    String storedJsonTask = jsonEncode(newJsonTask);
    storage.setItem("task", storedJsonTask);
    notifyListeners();
  }

  void updateStatusTask(int index, String status) {
    _task[index].status = status;
    List<Map<String, dynamic>> newJsonTask =
        _task.map((e) => e.toJson()).toList();
    String storedJsonTask = jsonEncode(newJsonTask);
    storage.setItem("task", storedJsonTask);
    notifyListeners();
  }
}
