import 'package:flutter/material.dart';
import 'package:xogame/GameBoard.dart';
import 'package:xogame/Login_Screen.dart';

void main(){
  runApp(MyApp());

  }
class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        GameBoard.routName : (context) => GameBoard(),
        LoginScreen.routeName : (context) => LoginScreen()
      },
      initialRoute: LoginScreen.routeName,

      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme:TextTheme(
          headline3:TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
      ) ),

    );
  }
}