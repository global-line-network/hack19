import '../../ModelLayer/model/jobStatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StatusStopCard extends StatefulWidget {
  final JobStatus jobStatus;
  final bool isLeft;
  static const double height = 80.0;
  static const double width = 140.0;

  const StatusStopCard(
      {Key key, @required this.jobStatus, @required this.isLeft})
      : super(key: key);

  @override
  StatusStopCardCardState createState() => StatusStopCardCardState();
}

class StatusStopCardCardState extends State<StatusStopCard>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _cardSizeAnimation;
  Animation<double> _durationPositionAnimation;
  Animation<double> _airportsPositionAnimation;
  Animation<double> _datePositionAnimation;
  Animation<double> _pricePositionAnimation;
  Animation<double> _fromToPositionAnimation;
  Animation<double> _lineAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 600));
    _cardSizeAnimation = new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(0.0, 0.9, curve: new ElasticOutCurve(0.8)));
    _durationPositionAnimation = new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(0.05, 0.95, curve: new ElasticOutCurve(0.95)));
    _airportsPositionAnimation = new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(0.1, 1.0, curve: new ElasticOutCurve(0.95)));
    _datePositionAnimation = new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(0.1, 0.8, curve: new ElasticOutCurve(0.95)));
    _pricePositionAnimation = new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(0.0, 0.9, curve: new ElasticOutCurve(0.95)));
    _fromToPositionAnimation = new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(0.1, 0.95, curve: new ElasticOutCurve(0.95)));
    _lineAnimation = new CurvedAnimation(
        parent: _animationController,
        curve: new Interval(0.0, 0.2, curve: Curves.linear));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void runAnimation() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: StatusStopCard.height,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => new Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                buildLine(),
                buildCard(),
                buildSummaryText(),
                buildStatusText(),
                buildDateText(),
              ],
            ),
      ),
    );
  }

  double get maxWidth {
    RenderBox renderBox = context.findRenderObject();
    BoxConstraints constraints = renderBox?.constraints;
    double maxWidth = constraints?.maxWidth ?? 0.0;
    return maxWidth;
  }

  Positioned buildStatusText() {
    double animationValue = _airportsPositionAnimation.value;
    return Positioned(
      top: getMarginTop(animationValue),
      left: getMarginLeft(animationValue),
      child: Text(
        "${widget.jobStatus.title}",
        style: new TextStyle(
          fontSize: 14.0 * animationValue,
          color: Colors.grey,
        ),
      ),
    );
  }

  Positioned buildSummaryText() {
    double animationValue = _datePositionAnimation.value;
    return Positioned(
      left: getMarginLeft(animationValue),
      child: Text(
        "${widget.jobStatus.summary}",
        style: new TextStyle(
          fontSize: 10.0 * animationValue,
          color: Colors.grey,
        ),
      ),
    );
  }

  Positioned buildDateText() {
    double animationValue = _fromToPositionAnimation.value;
    return Positioned(
      left: getMarginLeft(animationValue),
      bottom: getMarginBottom(animationValue),
      child: Text(
        "${widget.jobStatus.date}",
        style: new TextStyle(
          fontSize: 12.0 * animationValue,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildLine() {
    double animationValue = _lineAnimation.value;
    double maxLength = maxWidth - StatusStopCard.width;
    return Align(
        alignment: widget.isLeft ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          height: 2.0,
          width: maxLength * animationValue,
          color: Color.fromARGB(255, 200, 200, 200),
        ));
  }

  Positioned buildCard() {
    double animationValue = _cardSizeAnimation.value;
    double minOuterMargin = 8.0;
    double outerMargin = minOuterMargin + (1 - animationValue) * maxWidth;
    return Positioned(
      right: widget.isLeft ? null : outerMargin,
      left: widget.isLeft ? outerMargin : null,
      child: Transform.scale(
        scale: animationValue,
        child: Container(
          width: 140.0,
          height: 80.0,
          child: new Card(
            color: Colors.grey.shade100,
          ),
        ),
      ),
    );
  }

  double getMarginBottom(double animationValue) {
    double minBottomMargin = 8.0;
    double bottomMargin =
        minBottomMargin + (1 - animationValue) * minBottomMargin;
    return bottomMargin;
  }

  double getMarginTop(double animationValue) {
    double minMarginTop = 8.0;
    double marginTop =
        minMarginTop + (1 - animationValue) * StatusStopCard.height * 0.5;
    return marginTop;
  }

  double getMarginLeft(double animationValue) {
    return getMarginHorizontal(animationValue, true);
  }

  double getMarginRight(double animationValue) {
    return getMarginHorizontal(animationValue, false);
  }

  double getMarginHorizontal(double animationValue, bool isTextLeft) {
    if (isTextLeft == widget.isLeft) {
      double minHorizontalMargin = 16.0;
      double maxHorizontalMargin = maxWidth - minHorizontalMargin;
      double horizontalMargin =
          minHorizontalMargin + (1 - animationValue) * maxHorizontalMargin;
      return horizontalMargin;
    } else {
      double maxHorizontalMargin = maxWidth - StatusStopCard.width;
      double horizontalMargin = animationValue * maxHorizontalMargin;
      return horizontalMargin;
    }
  }
}
