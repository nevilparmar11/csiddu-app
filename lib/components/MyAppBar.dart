import 'package:csiddu/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:csiddu/Constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  String URL = "http://csiddu.in";

  _launchURL() async {
    if (await canLaunch(URL)) {
      await launch(URL);
    } else {
      print('could not launch');
      throw 'Could not launch $URL';
    }
  }

  void handleClick(String value) {
    switch (value) {
      case 'Visit Our Site':
        print("Trying to open website");
        _launchURL();
        break;
      case 'Exit':
        print("Exiting app");
        SystemNavigator.pop();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientAppBar(
      centerTitle: true,
      title: Text(
        appBarString,
        style: TextStyle(color: Colors.white, fontSize: 19),
      ),
      gradient: LinearGradient(colors: [
        MyColors.primaryColor,
        MyColors.regularNavyBlue,
        MyColors.naviBlueLight
      ]),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: handleClick,
          itemBuilder: (BuildContext context) {
            return {'Visit Our Site', 'Exit'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }
}
