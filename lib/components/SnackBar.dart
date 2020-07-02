import 'package:flutter/material.dart';
import 'package:csiddu/theme.dart';

showCustomSnackBar(BuildContext context, String content, String action,
    int duration, Function func) {
  final snackBar = new SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      content,
      style: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    duration: new Duration(seconds: duration),
    backgroundColor: MyColors.regularNavyBlue,
    action: SnackBarAction(
      label: action,
      textColor: Colors.white,
      onPressed: () async {
        await func();
        SnackBarClosedReason.dismiss;
      },
    ),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}
