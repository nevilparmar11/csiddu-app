import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csiddu/Models/UserModel.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:csiddu/Models/EventModel.dart';
import 'sign_in.dart';

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
        CollectionReference reference = Firestore.instance.collection('users');

        reference.document(User.uid).setData({
          "First Name": User.fname,
          "Last Name": User.lname,
          "Student ID": User.studentId,
          "Branch": User.branch,
          "Semester": User.semester,
          "Phone No.": User.phoneNo,
          "Created On": FieldValue.serverTimestamp()
        });

        reference = Firestore.instance.collection('userRegisteredEvents');
        reference.document("user-" + User.uid).setData({
          "myRegisteredEvents": new List<String>(),
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
    if (User.branch == null && User.semester == null) {
      if (await isLoggedIn()) {
        if (user.uid != null) {
          CollectionReference reference =
              Firestore.instance.collection('users');

          DocumentSnapshot dc = await reference.document(user.uid).get();
          if (dc == null) {
            isSpecialCase = true;
            return;
          }
          User.fname = dc.data["First Name"];
          User.lname = dc.data["Last Name"];
          User.branch = dc.data["Branch"];
          User.studentId = dc.data["Student ID"];
          User.phoneNo = dc.data["Phone No."];
          User.registeredOn = dc.data["Created On"];
          User.semester = dc.data["Semester"];
          User.uid = user.uid;

          reference = Firestore.instance.collection('userRegisteredEvents');
          dc = await reference.document("user-" + user.uid).get();
          print(dc.documentID);
          User.myRegisteredEvents = dc.data["myRegisteredEvents"];

          // Initialize my registered events details
          await CrudMethodsEvents.fetchMyRegisteredEvents();
        } else {
          print("Something Wrong happened");
        }
      } else {
        print('You need to be logged in first');
      }
    } else {
      print("User model is already initialized");
    }
  }

  // function to register user in *eventID* event
  Future<Event> registerMe(
      String eventID, Event event, Function callback) async {
    if (await isLoggedIn()) {
      Firestore.instance.runTransaction((transaction) async {
        // Update the user model and users-db
        CollectionReference reference =
            Firestore.instance.collection('userRegisteredEvents');

        User.myRegisteredEvents.add(eventID);
        await reference.document("user-" + user.uid).updateData({
          "myRegisteredEvents": User.myRegisteredEvents,
        });

        // update the users model, eventModel locally and db both
        reference = Firestore.instance.collection("eventRegisteration");
        DocumentSnapshot dc =
            await reference.document("event-" + eventID).get();

        List<dynamic> participants = dc.data["participants"];
        participants.add(user.uid);
        await reference.document("event-" + eventID).updateData({
          "participants": participants,
        });

        // Update the count of registeration
        reference = Firestore.instance.collection("events");
        dc = await reference.document(eventID).get();
        int currentAvailable = dc.data["currentAvailable"];
        int registered = dc.data["registered"];
        await reference.document(eventID).updateData({
          "currentAvailable": currentAvailable - 1,
          "registered": registered + 1,
        });
        event.currentAvailable = currentAvailable - 1;
        event.registered = registered + 1;

        print("Registering user for the event.");
        print("Now calling setstate method of parent");
        await CrudMethodsEvents.fetchMyRegisteredEvents();
        callback(event);
      });
    } else {
      print('You need to be logged in first');
    }

    return event;
  }
}

class CrudMethodsEvents {
  Stream<QuerySnapshot> fetchEvents() {
    print("Fetch method was called");
    return (Firestore.instance
        .collection('events')
        .orderBy('postedOn', descending: true)
        .where('isLive', isEqualTo: true)
        .snapshots());
  }

  static fetchMyRegisteredEvents() async {
    try {
      if (User.myRegisteredEvents != null) {
        CollectionReference cf = Firestore.instance.collection("events");
        for (String s in User.myRegisteredEvents) {
          DocumentSnapshot dc = await cf.document(s).get();
          String eventName = dc.data["eventName"];
          String date = dc.data["date"];
          String feedbackLink = dc.data["feedbackLink"];
          bool hasEnabledFeedback = dc.data["hasEnabledFeedback"];
          User.myRegisteredEventsDetails.add({
            "eventName": eventName,
            "date": date,
            "hasEnabledLink": hasEnabledFeedback,
            "feedbackLink": feedbackLink,
          });
        }
      } else {
        print("User has not registered for any event");
      }
    } catch (error) {
      print(error);
    }
  }
}
