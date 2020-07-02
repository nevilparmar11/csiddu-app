import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  static String uid, fname, lname, branch, studentId, semester, phoneNo = "#";
  static var myRegisteredEvents = new List();
  static var myRegisteredEventsDetails = new List();
  static Timestamp registeredOn;

  // Function to check participation of a user in particular event *eventID*
  static bool checkParticipation(String eventID) {
    print("MY REGISTERED EVENTS : " +
        User.myRegisteredEvents.toList().toString());
    if (User.myRegisteredEvents != null && User.myRegisteredEvents.isNotEmpty)
      return User.myRegisteredEvents.contains(eventID);
    else {
      print("My Registered Events are null");
      return false;
    }
  }
}

// Google signed User Model
class GUser {
  static String name, imageURL, emailID;
}
