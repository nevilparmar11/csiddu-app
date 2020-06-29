import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:csiddu/theme.dart';

GradientAppBar detailsAppBar(BuildContext context, String title, String date) {
  return GradientAppBar(
    gradient: LinearGradient(colors: [
      MyColors.primaryColor,
      MyColors.regularNavyBlue,
      MyColors.naviBlueLight
    ]),
    elevation: 20,
    centerTitle: true,
    title: Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
        Text(
          date,
          style: TextStyle(color: MyColors.primaryColorLight, fontSize: 15),
        ),
      ],
    ),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  );
}
