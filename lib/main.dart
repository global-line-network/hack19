import 'package:flutter/material.dart';
import 'package:hack19/screens/authentication/%20login.dart';
import 'screens/jobListing/job_listing.dart';
import 'DependencyInjection/injector.dart';
import 'navigator/navigator.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppNavigator.loginRoute,
      routes: {AppNavigator.jobListing: (context) => JobListingScreen()},
      home: LoginScreen(dataSource: Injector().modelLayer),
      
    );
  }
}









