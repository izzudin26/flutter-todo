import 'package:flutter/material.dart';
import 'package:todolist/views/Login.dart';
import 'package:todolist/views/MainNavigator.dart';
import 'package:todolist/views/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoList',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "SplashScreen",
      routes: {
        "SplashScreen": (context) => SplashScreen(),
        "MainNavigator": (context) => MainNavigator(),
        "Login": (context) => Login()
      },
    );
  }
}
