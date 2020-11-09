import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:localstorage/localstorage.dart';

class UserProvider extends ChangeNotifier {
    String username;
    LocalStorage storage = new LocalStorage("todolist");

    void getUsername() async {
      this.username = await storage.getItem("name");
      notifyListeners();
    }

    void setUsername(String newName) async {
      await storage.setItem("name", newName);
      notifyListeners();
    }
}