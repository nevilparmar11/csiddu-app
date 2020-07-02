import 'package:csiddu/Constants.dart';
import 'package:csiddu/Screens/HomeFeedTesting.dart';
import 'package:flutter/cupertino.dart';

import 'package:csiddu/Screens/MyProfileTesting.dart';
import 'package:csiddu/Screens/Predictor.dart';
import 'package:csiddu/Screens/RegisteredEvents.dart';

class Controller {
  Widget selectScreen(int number) {
    switch (number) {
      case 0:
        appBarString = "CSI DDU";
        return HomeFeedTesting();
        break;

      case 1:
        appBarString = "Registered Events";
        return RegisteredEvents();
        break;

      case 2:
        appBarString = "Marks Predictor";
        return Predictor();
        break;

      default:
        appBarString = "My Profile";
        return ProfilePage();
    }
  }
}
