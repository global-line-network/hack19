import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hack19/ModelLayer/model_layer.dart';
import 'package:hack19/ModelLayer/sharePrefs/shared_preferences.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Client _client;
  ModelLayer _modelLayer;
  SharedPreferencesLayer _preferencesLayer;
  GoogleSignIn _googleSignIn;
  FirebaseAuth _firebaseAuth;

  Injector._internal() {
    _preferencesLayer =
        SharedPreferencesLayerImpl(prefs: SharedPreferences.getInstance());
    _googleSignIn = GoogleSignIn(
        scopes: <String>['email', 'profile'],
        signInOption: SignInOption.standard);

    _firebaseAuth = FirebaseAuth.instance;

    _modelLayer = ModelLayerImpl(
        sharedPreferencesLayer: _preferencesLayer,
        googleSignIn: _googleSignIn,
        firebaseAuth: _firebaseAuth);
  }

  ModelLayer get modelLayer {
    return _modelLayer;
  }

//  DataSource get dataSource {
//    return new DataRepository(
//        client: new http.Client(), prefs: SharedPreferences.getInstance());
//  }

//  FirebaseAnalytics analytics = new FirebaseAnalytics();
//  FirebaseAnalyticsObserver get observer { return new FirebaseAnalyticsObserver(analytics: analytics);}
}
