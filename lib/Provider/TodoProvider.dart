import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todolist/Models/Todo.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class TodoProvider extends ChangeNotifier {
  String todoname;
  String duedate;

  LocalStorage storage = new LocalStorage("todolist");

  List<Todo> _task;
  List<Todo> get uncompleteTask => _task != null
      ? _task.where((element) => element.status == "unclomplete").toList()
      : _task;

  List<Todo> get recentTask => _task != null
      ? _task.where((element) => element.status != "uncomplete").toList()
      : _task;

  void getTask() async {
    _task = await storage.getItem("task");
    notifyListeners();
  }

  void addTask(Todo newTodo) {
    _task.add(newTodo);
    List<Map<String, dynamic>> newJsonTask = _task.map((e) => e.toJson()).toList();
    String storedJsonTask = jsonEncode(newJsonTask);
    storage.setItem("task", storedJsonTask);
    notifyListeners();
  }

  void removeTask(int index)async {
    _task.removeAt(index);
    List<Map<String, dynamic>> newJsonTask = _task.map((e) => e.toJson()).toList();
    String storedJsonTask = jsonEncode(newJsonTask);
    storage.setItem("task", storedJsonTask);
    notifyListeners();
  }

  void updateStatusTask(int index, String status){
    _task[index].status = status;
    List<Map<String, dynamic>> newJsonTask = _task.map((e) => e.toJson()).toList();
    String storedJsonTask = jsonEncode(newJsonTask);
    storage.setItem("task", storedJsonTask);
    notifyListeners();
  }

}
