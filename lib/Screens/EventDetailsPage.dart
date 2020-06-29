import 'package:csiddu/Models/EventModel.dart';
import 'package:csiddu/theme.dart';
import 'package:flutter/material.dart';
import 'package:csiddu/screens/components/app_bar.dart';
import 'package:csiddu/screens/components/body.dart';

class DetailsScreen extends StatelessWidget {
  Event event;
  DetailsScreen(Event e) {
    this.event = e;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      appBar: detailsAppBar(context, event.eventName, event.date),
      body: Body(event),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          event.currentAvailable.toString(),
          style: TextStyle(fontFamily: "QuickSandBold", fontSize: 30),
        ),
        icon: Icon(
          Icons.event_seat,
          size: 30,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
      ),
    );
  }
}
