import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hack19/ModelLayer/sharePrefs/shared_preferences.dart';

import 'model/login.dart';

abstract class ModelLayer {
  Future<LoginResponse> authenticateUser({@required LoginRequest request});
  saveUserCredentials({@required LoginResponse credentials});
}

class ModelLayerImpl implements ModelLayer {
  final SharedPreferencesLayer sharedPreferencesLayer;
  final GoogleSignIn googleSignIn;

  ModelLayerImpl(
      {@required this.sharedPreferencesLayer, @required this.googleSignIn})
      : assert(sharedPreferencesLayer != null, googleSignIn != null);

  @override
  Future<LoginResponse> authenticateUser({@required LoginRequest request}) {
    final requestJson = json.encode(request.toJson());
//    return networkLayer.loginUser(requestJson, "");
  }

  @override
  saveUserCredentials({@required LoginResponse credentials}) {
    sharedPreferencesLayer.setUserFullName(credentials.name);
    sharedPreferencesLayer.setUserProfileImage(credentials.imageUrl);
    sharedPreferencesLayer.setUserToken(credentials.token);
    sharedPreferencesLayer.setUserJobTitle(credentials.title);
  }
}
