import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:csiddu/theme.dart';

const Color theme_color = Color(0xFF13182B);
const Color bg_color = Color(0xFFF6C753);

num minFinder(num pointer) {
  num min;

  switch (pointer) {
    case 10:
      min = 81;
      break;

    case 9:
      min = 71;
      break;

    case 8:
      min = 61;
      break;

    case 7:
      min = 51;
      break;

    case 6:
      min = 41;
      break;

    case 5:
      min = 36;
      break;
    default:
  }

  return min;
}

num minFinder2(num pointer) {
  num min;

  switch (pointer) {
    case 10:
      min = 123;
      break;

    case 9:
      min = 108;
      break;

    case 8:
      min = 93;
      break;

    case 7:
      min = 78;
      break;

    case 6:
      min = 63;
      break;

    case 5:
      min = 56;
      break;
    default:
  }

  return min;
}

class Predictor extends StatefulWidget {
  @override
  _PredictorState createState() => _PredictorState();
}

class _PredictorState extends State<Predictor> {
  String result = "";
  var _formKey = GlobalKey<FormState>();

  TextEditingController sessional1Controller = new TextEditingController();

  TextEditingController sessional2Controller = new TextEditingController();

  TextEditingController sessional3Controller = new TextEditingController();

  TextEditingController maximummarksController = new TextEditingController();

  TextEditingController practivalorvivaController = new TextEditingController();

  TextEditingController pointerController = new TextEditingController();

  bool check() {
    if (maximummarksController.text == '100')
      return false;
    else
      return true;
  }

  String calculateTotalReturns() {
    if (sessional1Controller.text.isEmpty) {
      return "0";
    }

    num one = int.parse(sessional1Controller.text);
    num two = int.parse(sessional2Controller.text);
    num three = int.parse(sessional3Controller.text);
    num maximumMarks = int.parse(maximummarksController.text);
    num vivaMarsk = int.parse(practivalorvivaController.text);
    num pointer = int.parse(pointerController.text);
    num requiredMarks = 0;
    num result = 0;
    num avg = one + two + three;
    avg = avg / 3;

    if (maximumMarks == 100) {
      if (pointer >= 5) {
        requiredMarks = minFinder(pointer);
        result = requiredMarks - avg - vivaMarsk;
        return (result.toString());
      } else {
        HapticFeedback.heavyImpact();
        Fluttertoast.showToast(
          msg: "Pointer must be more than or equal to 5",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    } else if (maximumMarks == 150) {
      if (pointer >= 5) {
        requiredMarks = minFinder2(pointer);
        result = requiredMarks - avg - vivaMarsk;
        return (result.toString());
      } else {
        HapticFeedback.heavyImpact();
        Fluttertoast.showToast(
          msg: "Pointer must be more than or equal to 5",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            // gradient: LinearGradient(colors: [Colors.orangeAccent, bg_color]),
            gradient: LinearGradient(
                colors: [MyColors.primaryColor, MyColors.primaryColorLight]),
            color: Colors.orangeAccent,
            shape: BoxShape.rectangle),
        child: Form(
            key: _formKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(20),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45),
                ),
                Text(
                  "The Best Way To Predict The Future Is To Create It...",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                Material(
                  elevation: 40,
                  borderRadius: BorderRadius.circular(30),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter Marks";
                      }
                    },
                    textInputAction: TextInputAction.done,
                    controller: sessional1Controller,
                    autofocus: true,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: theme_color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: "First Sessional Marks",
                        hintText: "Out of 36",
                        hintStyle:
                            TextStyle(color: Colors.blueGrey, fontSize: 18),
                        hasFloatingPlaceholder: true,
                        labelStyle: TextStyle(color: Colors.lightBlue),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 11)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                ),
                Material(
                  elevation: 12,
                  borderRadius: BorderRadius.circular(30),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter Marks";
                      }
                    },
                    controller: sessional2Controller,
                    autofocus: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: theme_color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: "Second Sessional Marks",
                        hintText: "Out of 36",
                        hintStyle:
                            TextStyle(color: Colors.blueGrey, fontSize: 18),
                        hasFloatingPlaceholder: true,
                        labelStyle: TextStyle(color: Colors.lightBlue),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 13)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                ),
                Material(
                  elevation: 12,
                  borderRadius: BorderRadius.circular(30),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter Marks";
                      }
                    },
                    controller: sessional3Controller,
                    autofocus: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: theme_color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: "Third Sessional Marks",
                        hintText: "Out of 36",
                        hintStyle:
                            TextStyle(color: Colors.blueGrey, fontSize: 18),
                        hasFloatingPlaceholder: true,
                        labelStyle: TextStyle(color: Colors.lightBlue),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 13)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                ),
                Material(
                  elevation: 12,
                  borderRadius: BorderRadius.circular(30),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter Marks";
                      }
                    },
                    controller: maximummarksController,
                    autofocus: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: theme_color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: "Maximum Marks",
                        hintText: "100/150",
                        hintStyle:
                            TextStyle(color: Colors.blueGrey, fontSize: 18),
                        hasFloatingPlaceholder: true,
                        labelStyle: TextStyle(color: Colors.lightBlue),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 13)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                ),
                Material(
                  elevation: 12,
                  borderRadius: BorderRadius.circular(30),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter Marks";
                      }
                    },
                    controller: practivalorvivaController,
                    autofocus: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: theme_color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: "Practical/Viva",
                        hintText: "Out of 50",
                        counterText:
                            "Set this field to 0 if max. marks is 100.",
                        counterStyle: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                        hintStyle:
                            TextStyle(color: Colors.blueGrey, fontSize: 18),
                        hasFloatingPlaceholder: true,
                        labelStyle: TextStyle(color: Colors.lightBlue),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                ),
                Material(
                  elevation: 12,
                  borderRadius: BorderRadius.circular(30),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Enter Pointer Value";
                      }
                    },
                    controller: pointerController,
                    autofocus: true,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: theme_color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: "Desired Pointer Value",
                        hintText: "Out of 10",
                        hintStyle:
                            TextStyle(color: Colors.blueGrey, fontSize: 18),
                        hasFloatingPlaceholder: true,
                        labelStyle: TextStyle(color: Colors.lightBlue),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 13)),
                  ),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HapticFeedback.vibrate();

          setState(() {
            if (_formKey.currentState.validate()) {
              result = calculateTotalReturns();

              num r = num.parse(result);

              if (r > 60) {
                showDialog(
                    context: context,
                    builder: (_) => new AlertDialog(
                          title: Text(
                            ":Result:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          content: Text(
                            "Oh Snap..!!!\nLooks Like Impossible\nYou Need To Score $result/60 In External Exam...!!",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          backgroundColor: Colors.redAccent,
                        ));
                HapticFeedback.heavyImpact();
                HapticFeedback.heavyImpact();
              } else {
                showDialog(
                    context: context,
                    builder: (_) => new AlertDialog(
                          title: Text(
                            ":Result:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          content: Text(
                            "Scoring $result/60 Marks In External Exam Can Help You To Achieve Desired Pointer.\n             ...Best Of Luck Dear...",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          backgroundColor: Colors.redAccent,
                        ));
                HapticFeedback.heavyImpact();
                HapticFeedback.heavyImpact();
              }
            }
          });
        },
        focusColor: Colors.tealAccent,
        focusElevation: 25,
        child: Icon(
          Icons.done,
          semanticLabel: "Done",
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
