import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String eventId;
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
  bool isLive, isOpenForRegisteration, hasEndedRegisteration, eventDone;
  DocumentReference reference;

  Event(DocumentSnapshot data) {
    this.eventId = data.documentID;
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
    this.isLive = data["isLive"];
    this.isOpenForRegisteration = data["isOpenForRegisteration"];
    this.hasEndedRegisteration = data["hasEndedRegisteration"];
    this.eventDone = data["eventDone"];
  }

  @override
  String toString() {
    return this.eventId +
        "\n" +
        this.branch +
        "\n" +
        this.eventName +
        "\n" +
        this.currentAvailable.toString() +
        "\n" +
        this.date +
        "\n" +
        this.description +
        "\n" +
        this.extraInfo +
        "\n" +
        this.imageUrl +
        "\n" +
        this.postedOn.toDate().toString() +
        "\n" +
        this.semesters.toList().toString() +
        "\n" +
        this.timings +
        "\n" +
        this.totalSeats.toString() +
        "\n" +
        this.totalSeats.toString() +
        "\n" +
        this.venue +
        "\n" +
        this.whatToBring +
        "\n" +
        this.registered.toString() +
        "\n" +
        this.reference.toString() +
        "\n" +
        "isLive = " +
        this.isLive.toString() +
        "\n" +
        "isOpenForRegisteration = " +
        this.isOpenForRegisteration.toString() +
        "\n" +
        "hasEndedRegisteration = " +
        this.hasEndedRegisteration.toString() +
        "\n" +
        "eventDone = " +
        this.eventDone.toString();
  }
}
