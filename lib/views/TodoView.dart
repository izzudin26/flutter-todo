import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/Provider/TodoProvider.dart';
import 'package:intl/intl.dart';
import 'components/FloatButton.dart';

class TodoView extends StatelessWidget {
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
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: Scaffold(
        floatingActionButton: FloatButton(providercontext: context),
          body: ListView(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                height: size.height * .3,
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
                        Text(
                          "Todo Nama",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )
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
              Positioned(top: size.height * .2, child: todolist(context)),
              Container(
                height: size.height * .7,
              )
            ],
          ),
        ],
      )),
    );
  }

  Widget todolist(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bekerja"),
                        IconButton(icon: Icon(Icons.delete), onPressed: () {})
                      ],
                    ),
                    subtitle: Text("12-Nov-2020"),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.lightGreen,
                        ),
                        onPressed: () {},
                      )),
                      Expanded(
                          child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.redAccent,
                        ),
                        onPressed: () {},
                      ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
