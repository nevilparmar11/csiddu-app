import 'package:csiddu/theme.dart';
import 'package:flutter/material.dart';
import 'package:csiddu/Models/EventModel.dart';

class RegisterButton extends StatefulWidget {
  Size size;
  Function press;
  bool participation;
  Event event;

  RegisterButton(Size size, Function func, bool ok, Event e) {
    this.size = size;
    this.press = func;
    this.participation = ok;
    this.event = e;
  }

  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  String _handleTextForButton() {
    int count = widget.event.currentAvailable;
    if (widget.event.isOpenForRegisteration) {
      if (widget.event.eventDone) {
        return "Not Accepting Registrations";
      } else if (widget.event.hasEndedRegisteration)
        return "Temporarily Closed";
      else {
        if (widget.participation) {
          return "Registered";
        } else {
          if (count == 0) {
            return "Seats are Full";
          } else {
            return "Count Me In";
          }
        }
      }
    }
    return "Registration Will Start Soon";
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: widget.size.width / 5,
      height: 50,
      child: RaisedButton(
          disabledColor: Colors.grey[500],
          shape: StadiumBorder(),
          onPressed: widget.participation ||
                  !widget.event.isOpenForRegisteration ||
                  widget.event.eventDone ||
                  widget.event.currentAvailable == 0
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
                _handleTextForButton(),
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
