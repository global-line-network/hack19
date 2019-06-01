import 'package:flutter/material.dart';

import 'navigator/navigator.dart';
import 'screens/jobListing/job_listing.dart';

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
      initialRoute: AppNavigator.jobListing,
      routes: {},
      home: JobListingScreen(),
    );
  }
}
