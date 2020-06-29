import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csiddu/Models/UserModel.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CrudMethodsUsers {
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

  initializeUserModel() async {
    print("initializing User Model");
    if (await isLoggedIn()) {
      if (user.uid != null) {
        CollectionReference reference =
            await Firestore.instance.collection('users');

        DocumentSnapshot dc = await reference.document(user.uid).get();
        User.fname = dc.data["First Name"];
        User.lname = dc.data["Last Name"];
        User.branch = dc.data["Branch"];
        User.studentId = dc.data["Student ID"];
        User.phoneNo = dc.data["Phone No."];
        User.registeredOn = dc.data["Created On"];
        User.semester = dc.data["Semester"];
        User.uid = user.uid;
      } else {
        print("Something Wrong happened");
      }
    } else {
      print('You need to be logged in first');
    }
  }
}

class CrudMethodsEvents {
  Stream<QuerySnapshot> fetchEvents() {
    print("Fetch method was called");
    return Firestore.instance
        .collection('events')
        .orderBy('postedOn', descending: true)
        .snapshots();
  }
}
