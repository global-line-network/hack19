import 'package:flutter/material.dart';

class JobItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 64, horizontal: 30),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(16.0)),
      color: Colors.white,
      elevation: 4,
      child: Container(
        child: Center(
          child: Text("Page"),
        ),
      ),
    );
  }
}
