import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  static String uid, fname, lname, branch, studentId, semester, phoneNo = "#";
  static Timestamp registeredOn;
}

// Google signed User Model
class GUser {
  static String name, imageURL, emailID;
}
