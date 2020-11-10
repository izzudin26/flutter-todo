import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class UserProvider extends ChangeNotifier {
    String username;
    LocalStorage storage = new LocalStorage("todolist");

    Future<String> getUsername() async {
      String getName = await storage.getItem("name");
      this.username = getName;
      print(getName);
      notifyListeners();
      return getName;
    }

    void setUsername() async {
      await storage.setItem("name", username);
      notifyListeners();
    }
}