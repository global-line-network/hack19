import 'dart:async';

import 'animated_dot.dart';
import 'AnimatedStatusIcon.dart';
import '../../ModelLayer/model/jobStatus.dart';
import 'statusStopcard.dart';
import 'package:flutter/material.dart';

class AppliedScreen extends StatefulWidget {
  final double height;
  final double status;
  final VoidCallback onStateProgressStart;

  const AppliedScreen(
      {Key key, this.height, this.status, this.onStateProgressStart})
      : super(key: key);

  @override
  _AppliedScreenState createState() => _AppliedScreenState();
}

class _AppliedScreenState extends State<AppliedScreen>
    with TickerProviderStateMixin {
  final double _initialStatePaddingBottom = 16.0;
  final double _minStatePaddingTop = 16.0;
  final List<JobStatus> _jobStatus = [
    JobStatus(1, "4th Round", "", ""),
    JobStatus(2, "3rd Round", "Onsite interview", ""),
    JobStatus(3, "2nd Round", "Online assessment", ""),
    JobStatus(4, "1st Round", "Phone interview", "June 04")
  ];
  final List<GlobalKey<StatusStopCardCardState>> _stopKeys = [];

  AnimationController _stateSizeAnimationController;
  AnimationController _stateTravelController;
  AnimationController _dotsAnimationController;
  AnimationController _fabAnimationController;
  Animation _stateSizeAnimation;
  Animation _stateTravelAnimation;
  Animation _fabAnimation;

  List<Animation<double>> _dotPositions = [];

  double get _stateTopPadding =>
      _minStatePaddingTop +
      (1 - _stateTravelAnimation.value) * _maxStateTopPadding;

  double get _maxStateTopPadding =>
      100 - _minStatePaddingTop - _initialStatePaddingBottom - _stateSize;

  double get _stateSize => _stateSizeAnimation.value;

  @override
  void initState() {
    super.initState();
    _initSizeAnimations();
    _initStateTravelAnimations();
    _initDotAnimationController();
    _initDotAnimations();
    _initFabAnimationController();
    _jobStatus.forEach(
        (stop) => _stopKeys.add(new GlobalKey<StatusStopCardCardState>()));
    _stateSizeAnimationController.forward();
  }

  @override
  void dispose() {
    _stateSizeAnimationController.dispose();
    _stateTravelController.dispose();
    _dotsAnimationController.dispose();
    _fabAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
          alignment: Alignment.center,
          children: <Widget>[_buildState()]
            ..addAll(_jobStatus.map(_buildStopCard))
            ..addAll(_jobStatus.map(_mapStartStopToDot))),
    );
  }

  Widget _buildStopCard(JobStatus stop) {
    int index = _jobStatus.indexOf(stop);
    //_dotPositions[index].value
    double topMargin =
        (120 * stop.id) - 0.5 * (StatusStopCard.height - AnimatedDot.size);
    bool isLeft = index.isOdd;
    // print(stop.);
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: topMargin),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            isLeft ? Container() : Expanded(child: Container()),
            Expanded(
              child: StatusStopCard(
                key: _stopKeys[index],
                jobStatus: stop,
                isLeft: isLeft,
              ),
            ),
            !isLeft ? Container() : Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  Widget _mapStartStopToDot(stop) {
    int index = _jobStatus.indexOf(stop);
    bool isStartOrEnd = index == 0 || index == _jobStatus.length - 1;
    int stage = 3;
    int curStage = 2;
    Color color = (index > curStage) ? Colors.green : Colors.red;
    return AnimatedDot(
      animation: _dotPositions[index],
      color: color,
    );
  }

  Widget _buildState() {
    return AnimatedBuilder(
      animation: _stateTravelAnimation,
      child: Column(
        children: <Widget>[
          AnimatedStatusIcon(animation: _stateSizeAnimation),
          Container(
            width: 2.0,
            height: _jobStatus.length * StatusStopCard.height * 1.4,
            color: Color.fromARGB(255, 200, 200, 200),
          ),
        ],
      ),
      builder: (context, child) => Positioned(
            top: _stateTopPadding,
            child: child,
          ),
    );
  }

  _initSizeAnimations() {
    _stateSizeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 340),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(milliseconds: 500), () {
            widget?.onStateProgressStart();
            _stateTravelController.forward();
          });
          Future.delayed(Duration(milliseconds: 700), () {
            _dotsAnimationController.forward();
          });
        }
      });
    _stateSizeAnimation =
        Tween<double>(begin: 60.0, end: 36.0).animate(CurvedAnimation(
      parent: _stateSizeAnimationController,
      curve: Curves.easeOut,
    ));
  }

  _initStateTravelAnimations() {
    _stateTravelController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _stateTravelAnimation = CurvedAnimation(
      parent: _stateTravelController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _initDotAnimations() {
    //what part of whole animation takes one dot travel
    final double slideDurationInterval = 0.4;
    //what are delays between dot animations
    final double slideDelayInterval = 0.2;
    //at the bottom of the screen
    double startingMarginTop = widget.height;
    //minimal margin from the top (where first dot will be placed)
    double minMarginTop =
        _minStatePaddingTop + _stateSize + 0.5 * (1.4 * StatusStopCard.height);

    for (int i = 0; i < _jobStatus.length; i++) {
      final start = slideDelayInterval * i;
      final end = start + slideDurationInterval;

      double finalMarginTop = minMarginTop + i * (1.4 * StatusStopCard.height);
      Animation<double> animation = new Tween(
        begin: startingMarginTop,
        end: finalMarginTop,
      ).animate(
        new CurvedAnimation(
          parent: _dotsAnimationController,
          curve: new Interval(start, end, curve: Curves.easeOut),
        ),
      );
      // print(animation);
      _dotPositions.add(animation);
    }
  }

  void _initDotAnimationController() {
    _dotsAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animateFlightStopCards().then((_) => _animateFab());
        }
      });
  }

  Future _animateFlightStopCards() async {
    return Future.forEach(_stopKeys,
        (GlobalKey<StatusStopCardCardState> stopKey) {
      return new Future.delayed(Duration(milliseconds: 250), () {
        stopKey.currentState.runAnimation();
      });
    });
  }

  void _initFabAnimationController() {
    _fabAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
    _fabAnimation = new CurvedAnimation(
        parent: _fabAnimationController, curve: Curves.easeOut);
  }

  _animateFab() {
    _fabAnimationController.forward();
  }
}
