import 'package:cached_network_image/cached_network_image.dart';
import 'package:csiddu/CrudServices.dart';
import 'package:csiddu/Models/UserModel.dart';
import 'package:csiddu/theme.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/services.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  CrudMethods crudMethodsObj = new CrudMethods();

  ListTile _createListTile(String name, IconData iconname, Function fname) {
    return ListTile(
      leading: Icon(
        iconname,
        size: 25,
        color: Colors.black,
      ),
      title: Text(
        name,
        style: TextStyle(
            color: Colors.black, fontFamily: 'QuickSandRegular', fontSize: 22),
      ),
      onTap: () {
        fname();
      },
    );
  }

  ListTile madeWithLoveTile() {
    return ListTile(
      title: Center(
        child: Text(
          "Made With ❤",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'QuickSandRegular',
              fontSize: 16),
        ),
      ),
      subtitle: Center(
        child: Text(
          "BY CSI TEAM",
          style: TextStyle(
              color: Colors.black, fontFamily: 'QuickSandLight', fontSize: 11),
        ),
      ),
      contentPadding: EdgeInsets.all(10),
      onTap: () {
        print('Made with Love tapped');
      },
    );
  }

  _handleHome() {
    print('Home was tapped');
  }

  _handleSuggestion() {
    print('Suggestion was tapped');
  }

  _handleSignOut() {
    print('Sign Out was tapped');
    crudMethodsObj.signOutGoogle();
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: MyColors.regularNavyBlue),
              arrowColor: Colors.white,
              accountName: Text(
                GUser.name,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'QuickSandRegular',
                    fontSize: 24),
              ),
              accountEmail: Text(
                GUser.emailID,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'QuickSandMedium',
                    fontSize: 15),
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(GUser.imageURL),
                ),
              )),
          _createListTile("Home", Icons.home, _handleHome),
          _createListTile("Suggestion", Icons.feedback, _handleSuggestion),
          _createListTile("Sign Out", Icons.exit_to_app, _handleSignOut),
          Container(
            height: 200,
          ),
          madeWithLoveTile(),
        ],
      ),
      elevation: 12,
    );
  }
}
