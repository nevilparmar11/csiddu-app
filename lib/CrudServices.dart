import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csiddu/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CrudMethods {
  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseUser user;
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser() != null) {
      user = await FirebaseAuth.instance.currentUser();
      User.uid = user.uid;
      return true;
    }

    return false;
  }

  Future<void> addUserDetails() async {
    if (await isLoggedIn()) {
      Firestore.instance.runTransaction((transaction) async {
        CollectionReference reference =
            await Firestore.instance.collection('users');

        reference.document(User.uid).setData({
          "First Name": User.fname,
          "Last Name": User.lname,
          "Student ID": User.studentId,
          "Branch": User.branch,
          "Semester": User.semester,
          "Phone No.": User.phoneNo,
          "Created On": FieldValue.serverTimestamp()
        });
      });
    } else {
      print('You need to be logged in first');
    }
  }

  getUserDetails() async {
    if (await isLoggedIn()) {
      GUser.imageURL = user.photoUrl;
      GUser.emailID = user.email;
      GUser.name = user.displayName;
    } else {
      print('You need to be logged in first');
    }
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    print("User Signed Out");
  }
}
