import 'package:flutter/material.dart';
import 'package:flutter_unicons/unicons.dart';
import 'package:provider/provider.dart';
import 'package:todolist/Provider/TodoProvider.dart';

class TodoHistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<TodoProvider>(
        builder: (context, todoprov, _) => Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: todoprov.recentTask
                    .asMap()
                    .map((index, task) => MapEntry(
                        index,
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text(task.todoName),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(task.duedate.substring(0, 16)),
                                          Text(statusIndo(task.status))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: (){
                                  todoprov.removeTask(task);
                                })
                              ],
                            ),
                          ),
                        )))
                    .values
                    .toList(),
              ),
            ));
  }

  String statusIndo(String status) {
    return status == "failed" ? "Tidak dikerjakan" : "Telah dikerjakan";
  }
}
