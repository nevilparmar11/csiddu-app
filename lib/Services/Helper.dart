import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:csiddu/theme.dart';
import 'package:csiddu/components/SimpleRoundIconButton.dart';
import 'package:flutter/services.dart';

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('could not launch');
    throw 'Could not launch $url';
  }
}

bool ok;

checkInternet() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('connected');
      ok = true;
      return true;
    } else {
      ok = false;
      return false;
    }
  } on SocketException catch (_) {
    print('not connected');
    ok = false;
    return false;
  }
}

Widget handleNoInternet(BuildContext context) {
  return Scaffold(
    body: Center(
        child: Container(
      color: MyColors.primaryColor,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
          ),
          EmptyListWidget(
              image: null,
              packageImage: PackageImage.Image_4,
              title: 'Oh no !',
              subTitle: 'There is no Internet Connection',
              titleTextStyle: Theme.of(context)
                  .typography
                  .dense
                  .display1
                  .copyWith(color: Color(0xff9da9c7)),
              subtitleTextStyle: Theme.of(context)
                  .typography
                  .dense
                  .body2
                  .copyWith(color: Color(0xffabb8d6))),
          SizedBox(
            height: 20,
          ),
          SimpleRoundButton(
            backgroundColor: Colors.red,
            buttonText: Text(
              "EXIT",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "QuickSandBold",
              ),
              textScaleFactor: MediaQuery.of(context).textScaleFactor * 1.5,
            ),
            textColor: Colors.white,
            onPressed: () {
              SystemNavigator.pop();
            },
          )
        ],
      ),
    )),
  );
}
