import 'package:csiddu/CrudServices.dart';
import 'package:csiddu/Screens/Controller.dart';
import 'package:csiddu/components/MyAppBar.dart';
import 'package:csiddu/components/MyDrawer.dart';
import 'package:flutter/material.dart';
import 'package:csiddu/theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CrudMethodsUsers _crudMethodsObj = new CrudMethodsUsers();
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  Controller controllerObj = new Controller();

  @override
  void initState() {
    super.initState();
    _crudMethodsObj.getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        drawer: MyDrawer(),
        bottomNavigationBar: PreferredSize(
            child: CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: 0,
              height: 52.0,
              items: <Widget>[
                Icon(
                  Icons.list,
                  size: 30,
                  color: Colors.black,
                ),
                Icon(
                  Icons.event_available,
                  size: 30,
                  color: Colors.black,
                ),
                Icon(
                  Icons.history,
                  size: 30,
                  color: Colors.black,
                ),
                Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.black,
                ),
              ],
              color: Colors.white,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.white,
              animationCurve: Curves.linearToEaseOut,
              animationDuration: Duration(milliseconds: 400),
              onTap: (index) {
                HapticFeedback.vibrate();
                setState(() {
                  _page = index;
                });
              },
            ),
            preferredSize: Size.fromHeight(0)),
        body: Container(
          child: controllerObj.selectScreen(_page),
        ));
  }
}
