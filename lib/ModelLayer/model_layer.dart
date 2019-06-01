import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hack19/ModelLayer/sharePrefs/shared_preferences.dart';

import 'model/login.dart';
import 'model/post.dart';

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
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    print("signed in "+credential.toString());

    try {
      final FirebaseUser user =
          await firebaseAuth.signInWithCredential(credential);
      print("signed in " + user.displayName);
      return user;
    } catch (exception) {
      throw Exception(exception.toString());
    }
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

    posts.add(Post(
        name: "post 1",
        image:
            "https://www.expatica.com/nl/wp-content/uploads/sites/3/2018/11/shutterstock_532183876-1200x675.jpg",
        city: "KL",
        companyName: "Global Line Network",
        currency: "MYR",
        description:
            "laskjdhf ljksadhjjsdhkjfhskj skjdhf klshdf lasjkd lfkjash dlkfjh ",
        industry: "IT",
        salary: 10000.00));
    posts.add(Post(
        name: "post 2",
        image:
            "https://www.expatica.com/nl/wp-content/uploads/sites/3/2018/11/shutterstock_532183876-1200x675.jpg",
        city: "KL",
        companyName: "Global Line Network",
        currency: "MYR",
        description:
            "laskjdhf ljksadhjjsdhkjfhskj skjdhf klshdf lasjkd lfkjash dlkfjh ",
        industry: "IT",
        salary: 10000.00));

    posts.add(Post(
        name: "post 3",
        image:
            "https://www.expatica.com/nl/wp-content/uploads/sites/3/2018/11/shutterstock_532183876-1200x675.jpg",
        city: "KL",
        companyName: "Global Line Network",
        currency: "MYR",
        description:
            "laskjdhf ljksadhjjsdhkjfhskj skjdhf klshdf lasjkd lfkjash dlkfjh ",
        industry: "IT",
        salary: 10000.00));

    posts.add(Post(
        name: "post 4",
        image:
            "https://www.expatica.com/nl/wp-content/uploads/sites/3/2018/11/shutterstock_532183876-1200x675.jpg",
        city: "KL",
        companyName: "Global Line Network",
        currency: "MYR",
        description:
            "laskjdhf ljksadhjjsdhkjfhskj skjdhf klshdf lasjkd lfkjash dlkfjh ",
        industry: "IT",
        salary: 10000.00));

    return Future(() {
      return posts;
    });
  }
}
