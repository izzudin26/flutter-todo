import 'dart:async';

import 'package:provider/provider.dart';
import 'package:todolist/Provider/UserProvider.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  BuildContext providerctx;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer();
  }
  
  void _timer(){
    final duration = Duration(seconds: 3);
    Timer(duration, _getusername);
  }
  
  void _getusername(){
    final userprovider = Provider.of<UserProvider>(providerctx, listen: false);
    userprovider.getUsername()
    .then((value){
      if(value != null){
        Navigator.of(context).pushReplacementNamed("MainNavigator");
      }else{
        Navigator.of(context).pushReplacementNamed("Login");
      }
    })
    .catchError((onError) => print(onError.toString()));
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: Consumer<UserProvider>(
        builder:(context, userprov, _){
          providerctx = context;
          return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/loadingillustration.jpg", width: MediaQuery.of(context).size.width * .7,),
                  Padding(padding: EdgeInsets.only(top: 30),child: CircularProgressIndicator())
                ],
              ),
            ),
          ),
        );}
      ),
    );
  }
}
