import 'package:csiddu/HomeScreen.dart';
import 'package:csiddu/PhoneVerification.dart';
import 'package:csiddu/SignUpPage.dart';
import 'package:csiddu/components/SnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:csiddu/sign_in.dart';
import 'package:csiddu/Services/Helper.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showLoginButton = false;
  bool _showSomethingWrong = false;

  @override
  void initState() {
    super.initState();
    signInWithGoogle().whenComplete(() async {
      if ((firstTime || !hasFilledDetails || isSpecialCase) && isSignedIn) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
            return SignUpPage();
          }),
          ModalRoute.withName('/'),
        );
      } else if (!hasEnteredPhone && isSignedIn) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
            return PhoneVerificationPage();
          }),
          ModalRoute.withName('/'),
        );
      } else if (isSignedIn) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }),
          ModalRoute.withName('/'),
        );
      } else {
        setState(() {
          _showLoginButton = true;
          _showSomethingWrong = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/google_logo.png'),
                height: 90.0,
              ),
              Text("Sign In With Google",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(104, 104, 104, 1),
                  )),
              SizedBox(height: 120),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    if (_showLoginButton) {
      return Builder(builder: (BuildContext context) {
        return OutlineButton(
          splashColor: Colors.grey,
          onPressed: () {
            signInWithGoogle().whenComplete(() {
              if (isSignedIn) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }), ModalRoute.withName('/'));
              } else {
                showCustomSnackBar(
                  context,
                  "Please connect to the Internet and Retry",
                  "Okay",
                  3,
                  () {},
                );
              }
            });
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          highlightElevation: 0,
          borderSide: BorderSide(color: Colors.grey),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/images/google_logo.png"),
                  height: 35.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    } else {
      return OutlineButton(
        splashColor: Colors.grey,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
                strokeWidth: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Signing you in...',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
