import 'package:csiddu/theme.dart';
import 'package:flutter/material.dart';
import 'package:csiddu/Models/UserModel.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget _blueColors() {
    return Positioned(
      top: 0,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.58, 1],
                colors: [MyColors.primaryColor, MyColors.primaryColorLight])),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  Widget _getInfo() {
    return Positioned(
      top: 50,
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 260,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: MyColors.primaryColorLight,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("User Information",
                  style:
                      TextStyle(fontSize: 25, fontFamily: "QuickSandMedium")),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(GUser.imageURL),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        GUser.name,
                        style: TextStyle(
                            fontFamily: "QuickSandRegular", fontSize: 27),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Email:",
                          style: TextStyle(
                              fontFamily: "QuickSandBold", fontSize: 19),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              GUser.emailID,
                              style: TextStyle(
                                  fontFamily: "QuickSandRegular", fontSize: 19),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userOtherDetails() {
    return Positioned(
      top: 340,
      child: Container(
        margin: EdgeInsets.all(20),
        height: 270,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: MyColors.primaryColorLight,
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Other Details",
                style: TextStyle(fontFamily: "QuickSandMedium", fontSize: 27),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Branch : ",
                    style: TextStyle(fontFamily: "QuickSandBold", fontSize: 22),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 20,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        User.branch,
                        style: TextStyle(fontFamily: "QuickSandRegular"),
                        overflow: TextOverflow.ellipsis,
                        textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Semester : ",
                    style: TextStyle(fontFamily: "QuickSandBold", fontSize: 22),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        User.semester,
                        style: TextStyle(
                            fontFamily: "QuickSandRegular", fontSize: 19),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Student ID : ",
                    style: TextStyle(fontFamily: "QuickSandBold", fontSize: 22),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        User.studentId,
                        style: TextStyle(
                            fontFamily: "QuickSandRegular", fontSize: 19),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Phone No. : ",
                    style: TextStyle(fontFamily: "QuickSandBold", fontSize: 22),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        "(+91) -" + User.phoneNo,
                        style: TextStyle(
                            fontFamily: "QuickSandRegular", fontSize: 19),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          _blueColors(),
          _getInfo(),
          _userOtherDetails()
        ],
      ),
    );
  }
}
