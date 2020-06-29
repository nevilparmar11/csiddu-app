import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String branch;
  int currentAvailable;
  String date;
  String description;
  String eventName;
  String extraInfo;
  String imageUrl;
  Timestamp postedOn;
  var semesters = new List();
  String timings;
  int totalSeats;
  String venue;
  String whatToBring;
  int registered;
  DocumentReference reference;

  Event(DocumentSnapshot data) {
    this.branch = data["branch"];
    this.eventName = data["eventName"];
    this.currentAvailable = data["currentAvailable"];
    this.date = data["date"];
    this.description = data["description"];
    this.extraInfo = data["extraInfo"];
    this.imageUrl = data["imageUrl"];
    this.postedOn = data["postedOn"];
    this.semesters = data["semesters"];
    this.timings = data["timings"];
    this.totalSeats = data["totalSeats"];
    this.venue = data["venue"];
    this.whatToBring = data["whatToBring"];
    this.registered = data["registered"];
    this.reference = data.reference;
  }
}
