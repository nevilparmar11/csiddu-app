import 'package:cached_network_image/cached_network_image.dart';
import 'package:csiddu/Models/EventModel.dart';
import 'package:csiddu/theme.dart';
import 'package:flutter/material.dart';
import 'package:csiddu/Screens/components/register_button_testing.dart';
import 'package:csiddu/CrudServices.dart';
import 'package:csiddu/Models/UserModel.dart';

class Body extends StatefulWidget {
  Event event;
  Function registerMe;
  Body(Event e, Function registerMe) {
    this.event = e;
    this.registerMe = registerMe;
  }

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: widget.event.imageUrl,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: EventInfo(widget.event, widget.registerMe),
        ),
      ],
    );
  }
}

class EventInfo extends StatefulWidget {
  Event event;
  Function registerMe;
  EventInfo(Event e, Function registerMe) {
    this.event = e;
    this.registerMe = registerMe;
  }

  @override
  _EventInfoState createState() => _EventInfoState();
}

class _EventInfoState extends State<EventInfo> {
  @override
  void initState() {
    super.initState();
  }

  CrudMethodsUsers crudMethodsUsers = new CrudMethodsUsers();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              shopeName(name: widget.event.eventName, context: context),
              SizedBox(
                height: 20,
              ),
              Text(
                "What Is This Event About ?",
                style: TextStyle(fontFamily: "QuickSandBold", fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.event.description,
                style: TextStyle(
                    height: 1.5, fontFamily: "QuickSandRegular", fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "How Long will It Take ?",
                style: TextStyle(fontFamily: "QuickSandBold", fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.event.timings,
                style: TextStyle(
                    height: 1.5, fontFamily: "QuickSandRegular", fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Who Can Join ?",
                style: TextStyle(fontFamily: "QuickSandBold", fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Semesters " + widget.event.semesters.toList().toString(),
                style: TextStyle(
                    height: 1.5, fontFamily: "QuickSandRegular", fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "What To Bring ?",
                style: TextStyle(fontFamily: "QuickSandBold", fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.event.whatToBring,
                style: TextStyle(
                    height: 1.5, fontFamily: "QuickSandRegular", fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Any Extra Notes ?",
                style: TextStyle(fontFamily: "QuickSandBold", fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.event.extraInfo,
                style: TextStyle(
                    height: 1.5, fontFamily: "QuickSandRegular", fontSize: 20),
              ),

              SizedBox(height: size.height * 0.05),
              // Free space  10% of total height
              RegisterButton(
                  size,
                  widget.registerMe,
                  User.checkParticipation(
                    widget.event.eventId,
                  )),

              SizedBox(
                height: size.height * 0.03,
              )
            ],
          ),
        ));
  }

  Widget __location(String name, BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: MyColors.primaryColor,
          size: 25,
        ),
        SizedBox(width: 5),
        Text(
          widget.event.venue,
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
          style: TextStyle(
              fontFamily: "QuickSandLight", fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Row shopeName({String name, BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        __location(name, context),
        Text(
          "Total Seats : " + widget.event.totalSeats.toString(),
          textAlign: TextAlign.center,
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
          style: TextStyle(
              color: Colors.deepOrange,
              fontFamily: "QuickSandMedium",
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
