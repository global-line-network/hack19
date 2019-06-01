import 'package:flutter/material.dart';
import 'package:hack19/ModelLayer/model/post.dart';

import 'job_listing_item.dart';

class AllJobsViewPager2 extends StatefulWidget {
  final List<Post> posts;

  const AllJobsViewPager2({Key key, this.posts}) : super(key: key);

  @override
  _AllJobsViewPager2State createState() => _AllJobsViewPager2State();
}

class _AllJobsViewPager2State extends State<AllJobsViewPager2> {
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
    return PageView.builder(
      controller: controller,
      itemBuilder: (context, position) {
        if (position == currentPageValue.floor()) {
          return Transform(
            transform: Matrix4.identity()
              ..rotateY(currentPageValue - position)
              ..rotateZ(currentPageValue - position),
            child: JobItemView(
              post: widget.posts[position],
              isSecondPager: true,
            ),
          );
        } else if (position == currentPageValue.floor() + 1) {
          return Transform(
            transform: Matrix4.identity()
              ..rotateY(currentPageValue - position)
              ..rotateZ(currentPageValue - position),
            child: JobItemView(
              post: widget.posts[position],
              isSecondPager: true,
            ),
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
      itemCount: widget.posts.length,
    );
  }
}
