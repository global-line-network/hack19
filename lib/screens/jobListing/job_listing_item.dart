import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hack19/ModelLayer/model/post.dart';
import 'package:hack19/styles/style.dart';

class JobItemView extends StatelessWidget {
  final Post post;
  final isSecondPager;

  JobItemView({@required this.post, @required this.isSecondPager});

  final double imageHeight = 300;

  Widget get _buildImage => CachedNetworkImage(
        imageUrl: post.image,
        height: imageHeight,
        fit: BoxFit.fitHeight,
      );

  Widget get _buildOverlay => Container(
        height: imageHeight,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0, 1],
          colors: [Colors.black45, Colors.black45],
        )),
      );

  Widget get _buildInfo => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 50,
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
                size: 16,
              ),
              Text(
                post.city,
                style: postInfoStyle,
              )
            ],
          ),
          Container(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.business_center,
                color: Colors.white,
                size: 16,
              ),
              Text(
                post.industry,
                style: postInfoStyle,
              )
            ],
          ),
          Container(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.attach_money,
                color: Colors.white,
                size: 16,
              ),
              Text(
                post.currency,
                style: postInfoStyle,
              ),
              Container(
                width: 8,
              ),
              Text(
                "${post.salary}",
                style: postInfoStyle,
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.chevron_left,
                    color: Colors.red,
                    size: 40,
                  ),
                  Text(
                    isSecondPager ? "Reject" : "Don't Like",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    isSecondPager ? "ACCEPT" : "Like",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.green,
                    size: 40,
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              post.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          )
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
          children: <Widget>[_buildImage, _buildOverlay, _buildInfo],
        ));
  }
}
