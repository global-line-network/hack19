import 'package:flutter/material.dart';
import 'package:hack19/screens/jobStatus/jobStatus.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailCell extends StatelessWidget {
  final job;
  DetailCell(this.job);
  final double imageHeight = 350;

  Widget get _buildImage => CachedNetworkImage(
        imageUrl: job.image,
        height: imageHeight,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: new BoxConstraints(
            maxHeight: 700.0,
          ),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildImage,
                    Container(
                      height: 16.0,
                    ),
                    Text(
                      job.companyName,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Card(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(16.0)),
                      color: Colors.white,
                      child: Container(
                        margin: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Text(job.city),
                            Divider(),
                            Text(job.industry),
                            Divider(),
                            Text("${job.salary}")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 16.0,
                    ),
                    Text(
                      "About the Job",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Card(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(16.0)),
                      color: Colors.white,
                      child: Container(
                        margin: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[Text(job.description), Divider()],
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
        ),
        RaisedButton(
          onPressed: () {
            applyButtonTapped(context);
          },
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

  applyButtonTapped(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => JobStatusScreen()));
  }
}
