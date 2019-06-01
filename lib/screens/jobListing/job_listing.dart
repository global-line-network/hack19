import 'package:flutter/material.dart';

import '../../strings.dart';
import '../../styles/style.dart';
import 'job_view_pager.dart';

class JobListingScreen extends StatefulWidget {
  @override
  _JobListingScreenState createState() => _JobListingScreenState();
}

class _JobListingScreenState extends State<JobListingScreen> {
  PageController controller = PageController();
  var currentPageValue = 0.0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });

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
            new AllJobsViewPager(
                controller: controller, currentPageValue: currentPageValue),
            new AllJobsViewPager(
                controller: controller, currentPageValue: currentPageValue)
          ],
        ));
  }
}
