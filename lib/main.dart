import 'package:flutter/material.dart';

import 'DependencyInjection/injector.dart';
import 'package:hack19/screens/jobStatus/jobStatus.dart';
import 'navigator/navigator.dart';
import 'screens/jobListing/job_listing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppNavigator.jobListing,
      routes: {},
      home: JobListingScreen(dataSource: Injector().modelLayer),
    );
=======
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppNavigator.loginRoute,
        routes: {AppNavigator.jobListing: (context) => JobListingScreen()},
        // home: LoginScreen(dataSource: Injector().modelLayer),
        home: JobStatusScreen());
>>>>>>> 1f646d37cc0dbec4fd754cea4073609963466189
  }
}
