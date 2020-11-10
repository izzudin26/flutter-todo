import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/Provider/TodoProvider.dart';
import 'package:todolist/Provider/UserProvider.dart';
import 'TodoView.dart';
import 'TodoHistoryView.dart';
import 'package:flutter_unicons/flutter_unicons.dart';

class MainNavigator extends StatefulWidget {
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  List<Widget> page = [TodoView(), TodoHistoryView()];
  int idxPage = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider())
      ],
      child: Scaffold(
        body: page[idxPage],
        bottomNavigationBar: bottomNavigator(context),
      ),
    );
  }

  Widget bottomNavigator(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) {
          setState(() {
            idxPage = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: idxPage,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black.withOpacity(.60),
        items: [
          BottomNavigationBarItem(
              icon: Unicon(UniconData.uniHome, color: idxPage == 0 ? Colors.blueAccent : Colors.black.withOpacity(.60),), title: Text("Beranda")),
          BottomNavigationBarItem(
              icon: Unicon(UniconData.uniListUiAlt, color: idxPage == 1 ? Colors.blueAccent : Colors.black.withOpacity(.60),), title: Text("Riwayat"))
        ]);
  }
}
