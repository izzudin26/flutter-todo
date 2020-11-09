import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/Provider/TodoProvider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
        create: (context) => TodoProvider(),
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/illustration.jpg",
                          width: size.width * .8),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Consumer<TodoProvider>(
                              builder: (context, todoprov, _) => TextField(
                                    controller: TextEditingController(
                                        text: todoprov.fullName),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromRGBO(193, 192, 192, 200),
                                        labelText: "Nama",
                                        prefixIcon: Icon(Icons.people),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.blueAccent,
                                            ))),
                                  )),
                          Container(margin: EdgeInsets.only(top: 20),child: btnSubmit())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget btnSubmit() {
    return Container(
      height: 30.0,
      child: RaisedButton(
        onPressed: () {},
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
