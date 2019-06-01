import 'package:flutter/material.dart';
import 'package:hack19/ModelLayer/model/post.dart';
import 'package:hack19/ModelLayer/model_layer.dart';

import '../../strings.dart';
import '../../styles/style.dart';
import 'job_view_pager.dart';
import 'job_view_pager_2.dart';

class JobListingScreen extends StatefulWidget {
  final ModelLayer dataSource;

  JobListingScreen({this.dataSource});

  @override
  _JobListingScreenState createState() => _JobListingScreenState();
}

class _JobListingScreenState extends State<JobListingScreen> {
  List<Post> _posts = List();

  String pageTitle = AppStrings.appTitle;

  @override
  void initState() {
    _loadPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            pageTitle,
            style: appBarTitleStyle,
          ),
          backgroundColor: accentColor,
        ),
        body: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            new AllJobsViewPager(posts: _posts),
            new AllJobsViewPager2(posts: _posts)
          ],
          onPageChanged: (position) {
            setState(() {
              if (position == 0) {
                pageTitle = AppStrings.appTitle;
              } else {
                pageTitle = "My Favourite";
              }
            });
          },
        ));
  }

  void _loadPosts() {
    // widget.dataSource.fetchJobs().then((posts) {
    //   setState(() {
    //     this._posts = posts;
    //   });
    // }).catchError((error) {
    //   print("error is : ${error.toString()}");
    // });
  }
}
