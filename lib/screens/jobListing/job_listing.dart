import 'package:flutter/material.dart';

import '../../strings.dart';
import '../../styles/style.dart';
import 'job_listing_item.dart';

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

class AllJobsViewPager extends StatelessWidget {
  const AllJobsViewPager({
    Key key,
    @required this.controller,
    @required this.currentPageValue,
  }) : super(key: key);

  final PageController controller;
  final double currentPageValue;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemBuilder: (context, position) {
        if (position == currentPageValue.floor()) {
          return Transform(
            transform: Matrix4.identity()
              ..rotateY(currentPageValue - position)
              ..rotateZ(currentPageValue - position),
            child: JobItemView(),
          );
        } else if (position == currentPageValue.floor() + 1) {
          return Transform(
            transform: Matrix4.identity()
              ..rotateY(currentPageValue - position)
              ..rotateZ(currentPageValue - position),
            child: JobItemView(),
          );
        } else {
          return Container(
            color: position % 2 == 0 ? Colors.blue : Colors.pink,
            child: Center(
              child: Text(
                "Page",
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
            ),
          );
        }
      },
      itemCount: 10,
    );
  }
}
