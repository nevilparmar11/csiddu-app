import 'package:csiddu/CrudServices.dart';
import 'package:csiddu/Models/EventModel.dart';
import 'package:csiddu/theme.dart';
import 'package:flutter/material.dart';
import 'package:csiddu/screens/components/app_bar.dart';
import 'package:csiddu/screens/components/body.dart';
import 'package:csiddu/Screens/components/animated_loader.dart';

class DetailsScreen extends StatefulWidget {
  Event event;
  DetailsScreen(Event e) {
    this.event = e;
  }

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isLoading = false;
  void callback(Event ev) async {
    print("callback function of detailed screen was called");
    setState(() {
      widget.event = ev;
      isLoading = false;
    });
  }

  Widget showLoader() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: MyColors.primaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ColorLoader3(),
            Text(
              "Hold Right There Sparky  :)",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontFamily: "QuickSandLight",
              ),
              textScaleFactor: MediaQuery.of(context).textScaleFactor * 0.45,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _registerMe() async {
    CrudMethodsUsers crudMethodsUsers = new CrudMethodsUsers();
    try {
      print("Regiser Button was clicked");
      setState(() {
        isLoading = true;
      });
      Event ev = await crudMethodsUsers.registerMe(
          widget.event.eventId, widget.event, callback);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return showLoader();
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      appBar: detailsAppBar(context, widget.event.eventName, widget.event.date),
      body: Body(widget.event, _registerMe),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          widget.event.currentAvailable.toString(),
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
          style: TextStyle(fontFamily: "QuickSandBold"),
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
