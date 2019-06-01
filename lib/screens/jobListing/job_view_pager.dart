import 'package:flutter/material.dart';

import 'job_listing_item.dart';

class AllJobsViewPager extends StatefulWidget {
  const AllJobsViewPager({
    Key key,
    @required this.controller,
    @required this.currentPageValue,
  }) : super(key: key);

  final PageController controller;
  final double currentPageValue;

  @override
  _AllJobsViewPagerState createState() => _AllJobsViewPagerState();
}

class _AllJobsViewPagerState extends State<AllJobsViewPager> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.controller,
      itemBuilder: (context, position) {
        if (position == widget.currentPageValue.floor()) {
          return Transform(
            transform: Matrix4.identity()
              ..rotateY(widget.currentPageValue - position)
              ..rotateZ(widget.currentPageValue - position),
            child: JobItemView(),
          );
        } else if (position == widget.currentPageValue.floor() + 1) {
          return Transform(
            transform: Matrix4.identity()
              ..rotateY(widget.currentPageValue - position)
              ..rotateZ(widget.currentPageValue - position),
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
