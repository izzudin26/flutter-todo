import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_unicons/flutter_unicons.dart';
import 'package:provider/provider.dart';
import 'package:todolist/Provider/TodoProvider.dart';
import 'package:intl/intl.dart';
import 'package:todolist/Provider/UserProvider.dart';
import 'components/FloatButton.dart';
import 'package:todolist/Models/Todo.dart';
import 'package:todolist/views/components/TodoUncompleteList.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  String dateformatter() {
    DateTime _date = DateTime.now();
    String days = _date.toIso8601String().substring(8, 10);
    String month = _date.toIso8601String().substring(5, 7);
    String year = _date.toIso8601String().substring(0, 4);
    String date = indonesiaDay(DateFormat('EEEE').format(_date));
    return "$date, $days-$month-$year";
  }

  String indonesiaDay(String day) {
    List<String> engDay = [
      "monday",
      "tuesday",
      "wednesday",
      "thursday",
      "friday",
      "saturday",
      "sunday"
    ];
    List<String> idDay = [
      "senin",
      "selasa",
      "rabu",
      "kamis",
      "jumat",
      "sabtu",
      "minggu"
    ];
    return idDay[engDay.indexOf(day.toLowerCase())].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatButton(providercontext: context),
        body: Consumer<TodoProvider>(
          builder: (context, todoprovider, _) {
            if (todoprovider.uncompleteTask == null) {
              todoprovider.getTask();
            }
            return RefreshIndicator(
              onRefresh: () {
                return todoprovider.getTask();
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(30),
                      height: size.height * .2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Unicon(
                                UniconData.uniUser,
                                color: Colors.white,
                              ),
                              Consumer<UserProvider>(
                                  builder: (context, userprov, _) {
                                if (userprov.username == null) {
                                  userprov.getUsername();
                                  print(userprov.username);
                                }
                                return Text(
                                  "${userprov.username}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                );
                              })
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Text(
                                dateformatter(),
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      height: todoprovider.uncompleteTask.length < 1 ? size.height * .75 : null,
                        child: TodoUncompleteList()),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
