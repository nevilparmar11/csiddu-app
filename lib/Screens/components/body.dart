import 'package:cached_network_image/cached_network_image.dart';
import 'package:csiddu/Models/EventModel.dart';
import 'package:csiddu/theme.dart';
import 'package:flutter/material.dart';
import 'package:csiddu/Screens/components/item_image.dart';
import 'package:csiddu/Screens/components/register_button.dart';

class Body extends StatelessWidget {
  Event event;
  Body(Event e) {
    this.event = e;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: event.imageUrl,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: EventInfo(event),
        ),
      ],
    );
  }
}

class EventInfo extends StatelessWidget {
  Event event;

  EventInfo(Event e) {
    this.event = e;
  }

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
              shopeName(name: event.eventName),
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
                event.description,
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
                event.timings,
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
                "Semesters " + event.semesters.toList().toString(),
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
                event.whatToBring,
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
                event.extraInfo,
                style: TextStyle(
                    height: 1.5, fontFamily: "QuickSandRegular", fontSize: 20),
              ),

              SizedBox(height: size.height * 0.05),
              // Free space  10% of total height
              RegisterButton(
                size: size,
                press: () {},
              )
            ],
          ),
        ));
  }

  Widget __location(String name) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: MyColors.primaryColor,
          size: 25,
        ),
        SizedBox(width: 5),
        Text(
          event.venue,
          style: TextStyle(
              fontFamily: "QuickSandLight",
              fontSize: 18,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Row shopeName({String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        __location(name),
        Text(
          "Total Seats : " + event.totalSeats.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.deepOrange,
              fontFamily: "QuickSandMedium",
              fontSize: 18,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
