import 'package:flutter/cupertino.dart';

import 'package:csiddu/Screens/HomeFeed.dart';
import 'package:csiddu/Screens/MyProfile.dart';
import 'package:csiddu/Screens/PastEvents.dart';
import 'package:csiddu/Screens/RegisteredEvents.dart';

class Controller {
  Widget selectScreen(int number) {
    switch (number) {
      case 0:
        return HomeFeed();
        break;

      case 1:
        return RegisteredEvents();
        break;

      case 2:
        return PastEvents();
        break;

      default:
        return MyProfile();
    }
  }
}
