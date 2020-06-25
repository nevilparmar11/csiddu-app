import 'package:csiddu/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:csiddu/splash_screen.dart';

void main() => runApp(MaterialApp(
    theme: 
        ThemeData(primaryColor: Colors.blue, accentColor: Colors.blueAccent ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
));

class home_screen extends StatefulWidget {
  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen() ,
      routes: <String, WidgetBuilder>{
        // '/homePage': (BuildContext context)=>new MainPage(),
      },
    );
  }
}