import 'package:flutter/material.dart';
import 'package:hack19/ModelLayer/model_layer.dart';
import 'package:hack19/styles/style.dart';

import '../../strings.dart';
import '../../widgets.dart';

class LoginScreen extends StatefulWidget {
  final ModelLayer dataSource;

  LoginScreen({this.dataSource});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey key = GlobalKey<ScaffoldState>();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  // Background Image
  Widget get background => Image.asset(
        "assets/images/f_a_login_bg.png",
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      );

  // Google Button
  Widget get googleButton => googleLoginButton(onTap: _onGoogleLoginClicked);

  Widget get listOfOptions => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Google Button
            googleButton,
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    AppStrings.appTitle,
                    style: loginTextStyle,
                  ),
                  listOfOptions
                ],
              ),
      ),
    );
  }

  _onGoogleLoginClicked() {}
}
