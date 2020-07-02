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
  String url = "http://csiddu.in";

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('could not launch');
      throw 'Could not launch $url';
    }
  }

  void handleClick(String value) {
    switch (value) {
      case 'Visit Our Site':
        print("Trying to open website");
        _launchURL();
        break;

      case 'Feedback':
        print("Feedback was tapped");
        // _launchURL(feedbackURL);
        break;
      case 'Exit':
        print("Exiting app");
        SystemNavigator.pop();
        break;
    }
  }

  List<IconData> icons = [Icons.public, Icons.feedback, Icons.exit_to_app];
  static int i = 0;
  @override
  Widget build(BuildContext context) {
    return GradientAppBar(
      elevation: 100,
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
            return {'Visit Our Site', 'Feedback', 'Exit'}.map((String choice) {
              return PopupMenuItem<String>(
                  value: choice,
                  child: ListTile(
                    title: Text(
                      choice,
                      style: TextStyle(
                          fontFamily: "QuickSandMedium", fontSize: 15),
                    ),
                    leading: Icon(icons[i++ % 3]),
                  ));
            }).toList();
          },
        ),
      ],
    );
  }
}
