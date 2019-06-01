import 'package:flutter/material.dart';
import 'package:hack19/ModelLayer/model/post.dart';
import 'package:hack19/ModelLayer/model_layer.dart';

import '../../strings.dart';
import '../../styles/style.dart';
import 'job_view_pager.dart';

class JobListingScreen extends StatefulWidget {
  final ModelLayer dataSource;

  JobListingScreen({this.dataSource});

  @override
  _JobListingScreenState createState() => _JobListingScreenState();
}

class _JobListingScreenState extends State<JobListingScreen> {
  List<Post> _posts = List();

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
            AppStrings.appTitle,
            style: appBarTitleStyle,
          ),
          backgroundColor: accentColor,
        ),
        body: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            new AllJobsViewPager(posts: _posts),
            new AllJobsViewPager(posts: _posts)
          ],
        ));
  }

  void _loadPosts() {
    widget.dataSource.fetchJobs().then((posts) {
      setState(() {
        this._posts = posts;
      });
    }).catchError((error) {
      print("error is : ${error.toString()}");
    });
  }
}
