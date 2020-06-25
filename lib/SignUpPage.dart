import 'package:csiddu/PhoneVerification.dart';
import 'package:csiddu/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:csiddu/Animation/FadeAnimation.dart';

class SignUpPage extends StatefulWidget {
  static String uid, fname, lname, branch, studentId, semester, phoneNo = "#";
  static String verificationId;
  static String smsOTP;
  static String errorMessage = '';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = new GlobalKey<FormState>();

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      hasFilledDetails = true;
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color(0xff003366),
            Color(0xff003350),
            Color(0xff003340)
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "SignUp",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        1.3,
                        Text(
                          "Connect With Us",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                  // child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 60,
                          ),
                          FadeAnimation(
                              1.4,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(225, 95, 27, .3),
                                          blurRadius: 20,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white))),
                                        child: TextFormField(
                                          onSaved: (value) {
                                            setState(() {
                                              SignUpPage.fname = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            hintText: "First Name",
                                            hintStyle: TextStyle(
                                                color: Colors.black54),
                                            border: new UnderlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white))),
                                        child: TextFormField(
                                          onSaved: (value) {
                                            setState(() {
                                              SignUpPage.lname = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                              hintText: "Last Name",
                                              hintStyle: TextStyle(
                                                  color: Colors.black54),
                                              border:
                                                  new UnderlineInputBorder()),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white))),
                                        child: TextFormField(
                                          onSaved: (value) {
                                            setState(() {
                                              SignUpPage.studentId = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            hintText: "College Id",
                                            hintStyle: TextStyle(
                                                color: Colors.black54),
                                            border: new UnderlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(9),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white))),
                                        child: DropDownFormField(
                                          titleText: 'Branch',
                                          hintText: 'Please choose one :',
                                          value: SignUpPage.branch,
                                          onSaved: (value) {
                                            setState(() {
                                              SignUpPage.branch = value;
                                            });
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              SignUpPage.branch = value;
                                            });
                                          },
                                          dataSource: [
                                            {
                                              "display": "CE",
                                              "value": "CE",
                                            },
                                            {
                                              "display": "IT",
                                              "value": "IT",
                                            },
                                            {
                                              "display": "CH",
                                              "value": "CH",
                                            },
                                            {
                                              "display": "MH",
                                              "value": "MH",
                                            },
                                            {
                                              "display": "Civil",
                                              "value": "Civil",
                                            },
                                            {
                                              "display": "IC",
                                              "value": "IC",
                                            },
                                            {
                                              "display": "EC",
                                              "value": "EC",
                                            },
                                          ],
                                          textField: 'display',
                                          valueField: 'value',
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(9),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.white))),
                                        child: DropDownFormField(
                                          titleText: 'Semester',
                                          hintText: 'Please choose one :',
                                          value: SignUpPage.semester,
                                          onSaved: (value) {
                                            setState(() {
                                              SignUpPage.semester = value;
                                            });
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              SignUpPage.semester = value;
                                            });
                                          },
                                          dataSource: [
                                            {
                                              "display": "1",
                                              "value": "1",
                                            },
                                            {
                                              "display": "2",
                                              "value": "2",
                                            },
                                            {
                                              "display": "3",
                                              "value": "3",
                                            },
                                            {
                                              "display": "4",
                                              "value": "4",
                                            },
                                            {
                                              "display": "5",
                                              "value": "5",
                                            },
                                            {
                                              "display": "6",
                                              "value": "6",
                                            },
                                            {
                                              "display": "7",
                                              "value": "7",
                                            },
                                            {
                                              "display": "8",
                                              "value": "8",
                                            },
                                          ],
                                          textField: 'display',
                                          valueField: 'value',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          //FadeAnimation(1.5, Text("New User? Register Here.", style: TextStyle(color: Colors.grey),)),
                          SizedBox(
                            height: 40,
                          ),
                          FadeAnimation(
                              1.6,
                              Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xff003366)),
                                child: ButtonTheme(
                                  height: 50,
                                  minWidth: 200,
                                  child: FlatButton(
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    onPressed: () => {
                                      if (validateAndSave())
                                        {
                                          print(SignUpPage.fname),
                                          print(SignUpPage.lname),
                                          print(SignUpPage.branch),
                                          print(SignUpPage.studentId),
                                          print(SignUpPage.semester),
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PhoneVerificationPage()),
                                          ),
                                        }
                                    },
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
