import 'package:flutter/material.dart';

import '../../widgets.dart';

class LoginScreen extends StatefulWidget {
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
      body: isLoading
          ? CircularProgressIndicator()
          : Center(child: listOfOptions),
    );
  }

  _onGoogleLoginClicked() {}
}
