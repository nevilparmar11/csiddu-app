import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:csiddu/theme.dart';
import 'package:csiddu/components/SnackBar.dart';
import 'package:csiddu/Models/UserModel.dart';
import 'package:csiddu/Services/Helper.dart' as helper;

class RegisteredEvents extends StatefulWidget {
  @override
  _RegisteredEventsState createState() => _RegisteredEventsState();
}

class _RegisteredEventsState extends State<RegisteredEvents> {
  @override
  void initState() {
    super.initState();
    if (User.myRegisteredEvents.length != 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showCustomSnackBar(
              context,
              "Tap on any event to provide us your valuable feedback",
              "Sure !",
              3, () {
            print("snackbar function is working properly");
          }));
    }
  }

  Widget _handleNoRegisteredEvents() {
    return Center(
        child: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: EmptyListWidget(
          image: null,
          packageImage: PackageImage.Image_1,
          title: 'No Registered Events',
          subTitle: 'Looks like you did not attend any event',
          titleTextStyle: Theme.of(context)
              .typography
              .dense
              .display1
              .copyWith(color: Color(0xff9da9c7)),
          subtitleTextStyle: Theme.of(context)
              .typography
              .dense
              .body2
              .copyWith(color: Color(0xffabb8d6))),
    ));
  }

  @override
  Widget build(BuildContext context) {
    print(User.myRegisteredEvents);
    print(User.myRegisteredEventsDetails.toList().toString());

    if (User.myRegisteredEvents.length == 0) return _handleNoRegisteredEvents();
    return Container(
      color: Colors.orange[40],
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: User.myRegisteredEvents.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildListItem(index);
        },
      ),
    );
  }

  Widget _buildListItem(int index) {
    return InkWell(
      onTap: () async {
        print("Navigatig to feedback link");
        print(User.myRegisteredEventsDetails[index]["feedbackLink"]);
        if (User.myRegisteredEventsDetails[index]["hasEnabledFeedback"] ==
            "true")
          await helper
              .launchURL(User.myRegisteredEventsDetails[index]["feedbackLink"]);
        else
          showCustomSnackBar(context, "Oops...Feedback is not enabled yet",
              "Okay !", 3, () {});
      },
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.orange[50],
                  blurRadius: 25.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    15.0, // Move to right 10  horizontally
                    15.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
              color: MyColors.regularNavyBlue,
              border: Border.all(
                color: MyColors.primaryColorLight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right:
                              new BorderSide(width: 1.0, color: Colors.white))),
                  child: Icon(Icons.rate_review, color: Colors.white),
                ),
                title: Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    User.myRegisteredEventsDetails[index]["eventName"],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "QuickSandMedium",
                    ),
                    textScaleFactor:
                        MediaQuery.of(context).textScaleFactor * 1.2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      color: Colors.yellowAccent,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(User.myRegisteredEventsDetails[index]["date"],
                        style: TextStyle(color: Colors.white))
                  ],
                ),
                trailing: Icon(Icons.keyboard_arrow_right,
                    color: Colors.white, size: 30.0)),
          ),
        ],
      ),
    );
  }
}
