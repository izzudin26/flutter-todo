import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/Provider/TodoProvider.dart';
import 'package:todolist/Provider/UserProvider.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
        create: (context) => UserProvider(),
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
                          Consumer<UserProvider>(
                              builder: (context, userprovider, _){
                                return TextField(
                                    controller: TextEditingController(
                                        text: userprovider.username),
                                    onChanged: (value){
                                      userprovider.username = value;
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor:
                                            Color.fromRGBO(216, 215, 215, 200),
                                        labelText: "Nama",
                                        prefixIcon: Icon(Icons.people),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                              color: Colors.blueAccent,
                                            ))),
                                  );}),
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              child: btnSubmit())
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

  void showsnackbar(BuildContext context, String message){
    final snackbar = SnackBar(content: Text(message), duration: Duration(seconds: 3),);
    Scaffold.of(context).showSnackBar(snackbar);
  }

  Widget btnSubmit() {
    return Consumer<UserProvider>(
      builder:(context, userprov, _) => Container(
        height: 30.0,
        child: RaisedButton(
          onPressed: () {
            final provideruser = Provider.of<UserProvider>(context, listen: false);
            if(userprov.username == null || userprov.username.trim() == ""){
              showsnackbar(context, "Mohon Mengisi kolom nama");
            }else{
              provideruser.setUsername();
              Navigator.of(context).pushReplacementNamed("MainNavigator");
            }
          },
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
      ),
    );
  }
}
