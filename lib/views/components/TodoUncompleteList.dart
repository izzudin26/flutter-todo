import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/Provider/TodoProvider.dart';

class TodoUncompleteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<TodoProvider>(builder: (context, todoprovider, _) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: todoprovider.uncompleteTask == null ||
                todoprovider.uncompleteTask.length < 1
            ? Padding(
                padding: const EdgeInsets.all(40.0),
                child: Center(child: Text("0 Data")),
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: size.width * .2,
                      height: 5,
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Column(
                      children: todoprovider.uncompleteTask
                          .asMap()
                          .map((index, task) => MapEntry(
                              index,
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 2,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${task.todoName}"),
                                            IconButton(
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.deepOrange,
                                                ),
                                                onPressed: () {
                                                  todoprovider.removeTask(index);
                                                })
                                          ],
                                        ),
                                        subtitle: Text(task.duedate
                                            .toString()
                                            .substring(0, 16)),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: IconButton(
                                            icon: Icon(
                                              Icons.check,
                                              color: Colors.lightGreen,
                                            ),
                                            onPressed: () {
                                              todoprovider.updateStatusTask(
                                                  index, "complete");
                                            },
                                          )),
                                          Expanded(
                                              child: IconButton(
                                            icon: Icon(
                                              Icons.close,
                                              color: Colors.redAccent,
                                            ),
                                            onPressed: () {
                                              todoprovider.updateStatusTask(
                                                  index, "failed");
                                            },
                                          ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )))
                          .values
                          .toList()),
                ],
              ),
      );
    });
  }
}
