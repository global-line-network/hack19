import 'package:flutter/material.dart';

class DetailCell extends StatelessWidget {
  final job;
  DetailCell(this.job);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Image.network("job.image"),
                  Image.asset('assets/food.jpg'),
                  Container(
                    height: 16.0,
                  ),
                  Text(
                    "job.companyName",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Card(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(16.0)),
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Text("job.city"),
                          Divider(),
                          Text("job.industry"),
                          Divider(),
                          Text("job.salary")
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 16.0,
                  ),
                  Text(
                    "About the Job",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Card(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(16.0)),
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[Text("job.description"), Divider()],
                      ),
                    ),
                  ),
                  Container(
                    height: 16.0,
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
        RaisedButton(
          onPressed: applyButtonTapped,
          textColor: Colors.white,
          color: Colors.red,
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            "Apply",
          ),
        ),
      ],
    );
  }
}

applyButtonTapped() {
  
}
