import 'package:csiddu/theme.dart';
import 'package:flutter/material.dart';
import 'package:csiddu/Models/UserModel.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height - 80;

    return new Container(
        child: new Stack(children: <Widget>[
      new Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
          colors: [
            MyColors.primaryColor,
            MyColors.regularNavyBlue,
            Color(0xFF26CBE6)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
      ),
      Container(
        child: new Column(
          children: <Widget>[
            new Align(
              alignment: Alignment.center,
              child: new Padding(
                padding: new EdgeInsets.only(top: _height / 15),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: _height / 9.5,
                      backgroundColor: Color(0xFF26CBE6),
                      child: new CircleAvatar(
                        backgroundImage: NetworkImage(GUser.imageURL),
                        radius: _height / 10,
                      ),
                    ),
                    new SizedBox(
                      height: _height / 30,
                    ),
                    new Text(
                      GUser.name,
                      style: new TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: _height / 20),
              child: new Column(
                children: <Widget>[
                  infoChild(_width, Icons.email, GUser.emailID),
                  infoChild(_width, Icons.call, "(+91) - " + User.phoneNo),
                  infoChild(_width, Icons.school, User.branch),
                  infoChild(_width, Icons.confirmation_number, User.semester),
                  infoChild(_width, Icons.assignment_ind, User.studentId),
                  infoChild(
                      _width,
                      Icons.access_time,
                      _getRegisterationDate() +
                          "\n" +
                          "We know you since then :)"),
                ],
              ),
            )
          ],
        ),
      )
    ]));
  }

  Widget infoChild(double width, IconData icon, data) => new Padding(
        padding: new EdgeInsets.only(bottom: 8.0),
        child: new InkWell(
          child: new Row(
            children: <Widget>[
              new SizedBox(
                width: width / 8,
              ),
              new Icon(
                icon,
                color: const Color(0xFF26CBE6),
                size: 36.0,
              ),
              new SizedBox(
                width: width / 20,
              ),
              new Text(
                data,
                style: TextStyle(
                  fontFamily: "QuickSandLight",
                  color: Colors.white,
                  fontSize: 18,
                ),
              )
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );

  String _getRegisterationDate() {
    DateTime date = User.registeredOn.toDate();
    return DateFormat("dd-MM-yyyy").format(date);
  }
}
