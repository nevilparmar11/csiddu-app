import 'package:csiddu/theme.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class MyAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return GradientAppBar(
      centerTitle: true,
      title: Text(
        "CSI DDU",
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
      gradient: LinearGradient(colors: [
        MyColors.primaryColor,
        MyColors.regularNavyBlue,
        MyColors.naviBlueLight
      ]),
    );
  }
}
