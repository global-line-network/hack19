import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hack19/ModelLayer/model/post.dart';
import 'package:hack19/styles/style.dart';

class JobItemView extends StatelessWidget {
  final Post post;

  JobItemView({@required this.post});

  Widget get _buildImage => CachedNetworkImage(
        imageUrl: post.image,
        height: 400,
        fit: BoxFit.fitHeight,
      );

  Widget get _buildInfo => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 30,
          ),
          Text(
            post.name,
            style: appBarTitleStyle,
          ),
          Container(
            height: 20,
          ),
          Card(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(16.0)),
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text(post.companyName),
            ),
          ),
          Container(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.place,
                color: Colors.white,
              ),
              Text(
                post.city,
                style: appBarTitleStyle,
              )
            ],
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Card(
        borderOnForeground: false,
        margin: EdgeInsets.symmetric(vertical: 64, horizontal: 30),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(16.0)),
        color: Colors.white,
        elevation: 4,
        child: Stack(
          children: <Widget>[_buildImage, _buildInfo],
        ));
  }
}
