import 'package:csiddu/theme.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatefulWidget {
  Size size;
  Function press;
  bool participation;

  RegisterButton(Size size, Function func, bool ok) {
    this.size = size;
    this.press = func;
    this.participation = ok;
  }

  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: widget.size.width / 5,
      height: 50,
      child: RaisedButton(
          disabledColor: Colors.grey[500],
          shape: StadiumBorder(),
          onPressed: widget.participation
              ? null
              : () async {
                  await widget.press();
                },
          color: MyColors.primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(
                width: 13,
              ),
              Text(
                widget.participation ? "Registered" : "Count Me In",
                style: TextStyle(
                  fontFamily: "QuickSandLight",
                  fontSize: 30,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )),
    );
  }
}
