import 'applied.dart';
import 'package:flutter/material.dart';
import '../../strings.dart';
import '../../styles/style.dart';

class JobStatusScreen extends StatefulWidget {
  Size deviceSize;
  @override
  _JobStatusScreenState createState() => _JobStatusScreenState();
}

class _JobStatusScreenState extends State<JobStatusScreen> {
  GlobalKey key = GlobalKey<ScaffoldState>();
  Size deviceSize;
  String pageTitle = AppStrings.appTitle;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildContentContainer(Size deviceSize) {
    return Expanded(
      child: SingleChildScrollView(
        child: new ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: deviceSize.height,
          ),
          child: new IntrinsicHeight(
            child: AppliedScreen(height: deviceSize.height),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            pageTitle,
            style: appBarTitleStyle,
          ),
          backgroundColor: accentColor,
        ),
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[_buildContentContainer(deviceSize)],
                ),
        ));
  }
}
