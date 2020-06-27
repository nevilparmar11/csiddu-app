import 'package:csiddu/splash_screen.dart';
import 'package:csiddu/theme.dart';
import 'package:flutter/material.dart';
import 'package:csiddu/splash_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
          fontFamily: 'QuickSand',
          primaryColor: MyColors.primaryColor,
          accentColor: MyColors.primaryColorLight),
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
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        // '/homePage': (BuildContext context)=>new MainPage(),
      },
    );
  }
}
