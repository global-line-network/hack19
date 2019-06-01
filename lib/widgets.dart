import 'package:flutter/material.dart';
import 'package:hack19/strings.dart';

Widget googleLoginButton({@required Function onTap}) {
  return InkWell(
    onTap: onTap,
    child: new Container(
      width: 250.0,
      height: 50.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border.all(color: Colors.grey, width: 1.0),
        borderRadius: new BorderRadius.circular(10.0),
      ),
      child: new Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              "assets/images/ic_google.png",
              width: 23.0,
              height: 23.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: new Text(
                AppStrings.googleLogin,
                style: new TextStyle(fontSize: 13.0, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
