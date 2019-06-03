import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hack19/ModelLayer/sharePrefs/shared_preferences.dart';

import 'model/login.dart';
import 'model/post.dart';
import 'package:flutter/services.dart';

abstract class ModelLayer {
  Future<FirebaseUser> authenticateUser();
  saveUserCredentials({@required LoginResponse credentials});

  Future<List<Post>> fetchJobs();
}

class ModelLayerImpl implements ModelLayer {
  final SharedPreferencesLayer sharedPreferencesLayer;
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;

  ModelLayerImpl(
      {@required this.sharedPreferencesLayer,
      @required this.googleSignIn,
      @required this.firebaseAuth})
      : assert(sharedPreferencesLayer != null, googleSignIn != null);

  @override
  Future<FirebaseUser> authenticateUser() async {
  
  
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = await firebaseAuth.signInWithCredential(credential);
  print("signed in " + user.displayName);
  return user;
    
  }

  @override
  saveUserCredentials({@required LoginResponse credentials}) {
    sharedPreferencesLayer.setUserFullName(credentials.name);
    sharedPreferencesLayer.setUserProfileImage(credentials.imageUrl);
    sharedPreferencesLayer.setUserToken(credentials.token);
    sharedPreferencesLayer.setUserJobTitle(credentials.title);
  }

  @override
  Future<List<Post>> fetchJobs() {
    List<Post> posts = new List();

//    posts.add(Post(
//        name: "post 1",
//        image:
//            "https://www.expatica.com/nl/wp-content/uploads/sites/3/2018/11/shutterstock_532183876-1200x675.jpg",
//        city: "KL",
//        companyName: "Global Line Network",
//        currency: "MYR",
//        description:
//            "laskjdhf ljksadhjjsdhkjfhskj skjdhf klshdf lasjkd lfkjash dlkfjh ",
//        industry: "IT",
//        salary: 10000.00));
//    posts.add(Post(
//        name: "post 2",
//        image:
//            "https://www.expatica.com/nl/wp-content/uploads/sites/3/2018/11/shutterstock_532183876-1200x675.jpg",
//        city: "KL",
//        companyName: "Global Line Network",
//        currency: "MYR",
//        description:
//            "laskjdhf ljksadhjjsdhkjfhskj skjdhf klshdf lasjkd lfkjash dlkfjh ",
//        industry: "IT",
//        salary: 10000.00));
//
//    posts.add(Post(
//        name: "post 3",
//        image:
//            "https://www.expatica.com/nl/wp-content/uploads/sites/3/2018/11/shutterstock_532183876-1200x675.jpg",
//        city: "KL",
//        companyName: "Global Line Network",
//        currency: "MYR",
//        description:
//            "laskjdhf ljksadhjjsdhkjfhskj skjdhf klshdf lasjkd lfkjash dlkfjh ",
//        industry: "IT",
//        salary: 10000.00));
//
//    posts.add(Post(
//        name: "post 4",
//        image:
//            "https://www.expatica.com/nl/wp-content/uploads/sites/3/2018/11/shutterstock_532183876-1200x675.jpg",
//        city: "KL",
//        companyName: "Global Line Network",
//        currency: "MYR",
//        description:
//            "laskjdhf ljksadhjjsdhkjfhskj skjdhf klshdf lasjkd lfkjash dlkfjh ",
//        industry: "IT",
//        salary: 10000.00));

    final List<Map<String, dynamic>> data = [
      {
        "name": "Full Stack Software Engineer at Global Line Network",
        "companyName": "Global Line Network Sdn Bhd",
        "city": "Kuala Lumpur",
        "industry": "Technology & IT",
        "salary": 12000.00,
        "currency": "RM",
        "description":
            "Global Line Network (GLN) is a holding company consisting of a group of programmers who are client –focused, providing a sales and distribution platform (PaaS) to clients that require an enterprise-grade solution.",
        "image": "http://globalline.my/static/hack19/5.jpg"
      },
      {
        "name": "iOS mobile developer at Global Line Network",
        "companyName": "Global Line Network Sdn Bhd",
        "city": "Kuala Lumpur",
        "industry": "Technology & IT",
        "salary": 8500.00,
        "currency": "RM",
        "description":
            "We are currently seeking a Full Stack Senior Software Engineer to join our dynamic and growing team",
        "image": "http://globalline.my/static/hack19/5.jpg"
      },
      {
        "name": "Front-End Software Engineer at Global Line Network",
        "companyName": "Global Line Network Sdn Bhd",
        "city": "Kuala Lumpur",
        "industry": "Technology & IT",
        "salary": 12000.00,
        "currency": "RM",
        "description":
            "We are currently seeking a Full Stack Senior Software Engineer to join our dynamic and growing team",
        "image": "http://globalline.my/static/hack19/6.jpg"
      },
      {
        "name": "UI/UX designer at Global Line Network",
        "companyName": "Global Line Network Sdn Bhd",
        "city": "Kuala Lumpur",
        "industry": "Technology & IT",
        "salary": 9500.00,
        "currency": "RM",
        "description":
            "We are currently seeking a Full Stack Senior Software Engineer to join our dynamic and growing team",
        "image": "http://globalline.my/static/hack19/0.png"
      },
      {
        "name": "Full Stack Software Engineer at Global Line Network",
        "companyName": "Global Line Network Sdn Bhd",
        "city": "Kuala Lumpur",
        "industry": "Technology & IT",
        "salary": 12000.00,
        "currency": "RM",
        "description":
            "Global Line Network (GLN) is a holding company consisting of a group of programmers who are client –focused, providing a sales and distribution platform (PaaS) to clients that require an enterprise-grade solution.",
        "image": "http://globalline.my/static/hack19/4.jpg"
      },
      {
        "name": "Senior iOS mobile developer at Global Line Network",
        "companyName": "Global Line Network Sdn Bhd",
        "city": "Kuala Lumpur",
        "industry": "Technology & IT",
        "salary": 12500.00,
        "currency": "RM",
        "description":
            "We are currently seeking a Full Stack Senior Software Engineer to join our dynamic and growing team",
        "image": "http://globalline.my/static/hack19/2.jpg"
      },
      {
        "name": "Full Stack Software Engineer at Global Line Network",
        "companyName": "Global Line Network Sdn Bhd",
        "city": "Kuala Lumpur",
        "industry": "Technology & IT",
        "salary": 12000.00,
        "currency": "RM",
        "description":
            "We are currently seeking a Full Stack Senior Software Engineer to join our dynamic and growing team",
        "image": "http://globalline.my/static/hack19/6.jpg"
      },
      {
        "name": "Android mobile developer at Global Line Network",
        "companyName": "Global Line Network Sdn Bhd",
        "city": "Kuala Lumpur",
        "industry": "Technology & IT",
        "salary": 8500.00,
        "currency": "RM",
        "description":
            "We are currently seeking a Full Stack Senior Software Engineer to join our dynamic and growing team",
        "image": "http://globalline.my/static/hack19/3.jpg"
      },
      {
        "name": "Full Stack Software Engineer at Global Line Network",
        "companyName": "Global Line Network Sdn Bhd",
        "city": "Kuala Lumpur",
        "industry": "Technology & IT",
        "salary": 12000.00,
        "currency": "RM",
        "description":
            "Global Line Network (GLN) is a holding company consisting of a group of programmers who are client –focused, providing a sales and distribution platform (PaaS) to clients that require an enterprise-grade solution.",
        "image": "http://globalline.my/static/hack19/7.jpg"
      },
      {
        "name": "Senior iOS mobile developer at Global Line Network",
        "companyName": "Global Line Network Sdn Bhd",
        "city": "Kuala Lumpur",
        "industry": "Technology & IT",
        "salary": 11000.00,
        "currency": "RM",
        "description":
            "We are currently seeking a Full Stack Senior Software Engineer to join our dynamic and growing team",
        "image": "http://globalline.my/static/hack19/1.jpg"
      },
      {
        "name": "Front-End Software Engineer at Global Line Network",
        "companyName": "Global Line Network Sdn Bhd",
        "city": "Kuala Lumpur",
        "industry": "Technology & IT",
        "salary": 12000.00,
        "currency": "RM",
        "description":
            "Global Line Network (GLN) is a holding company consisting of a group of programmers who are client –focused, providing a sales and distribution platform (PaaS) to clients that require an enterprise-grade solution.",
        "image": "http://globalline.my/static/hack19/0.png"
      },
      {
        "name": "iOS mobile developer at Global Line Network",
        "companyName": "Global Line Network Sdn Bhd",
        "city": "Kuala Lumpur",
        "industry": "Technology & IT",
        "salary": 9000.00,
        "currency": "RM",
        "description":
            "We are currently seeking a Full Stack Senior Software Engineer to join our dynamic and growing team",
        "image": "http://globalline.my/static/hack19/1.jpg"
      }
    ];

    data.forEach((element) => posts.add(Post.fromJson(element)));

    return Future(() {
      return posts;
    });
  }
}
