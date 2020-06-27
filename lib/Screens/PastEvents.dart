import 'package:flutter/material.dart';

class PastEvents extends StatefulWidget {
  @override
  _PastEventsState createState() => _PastEventsState();
}

class _PastEventsState extends State<PastEvents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "PastEvents",
          textScaleFactor: 5,
        ),
      ),
    );
  }
}
