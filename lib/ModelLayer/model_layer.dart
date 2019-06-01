import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hack19/ModelLayer/sharePrefs/shared_preferences.dart';

import 'model/login.dart';
import 'network/network_layer.dart';

abstract class ModelLayer {
  Future<LoginResponse> authenticateUser({@required LoginRequest request});
  saveUserCredentials({@required LoginResponse credentials});
}

class ModelLayerImpl implements ModelLayer {
  final NetworkLayer networkLayer;
  final SharedPreferencesLayer sharedPreferencesLayer;

  ModelLayerImpl(
      {@required this.networkLayer, @required this.sharedPreferencesLayer})
      : assert(networkLayer != null, sharedPreferencesLayer != null);

  @override
  Future<LoginResponse> authenticateUser({@required LoginRequest request}) {
    final requestJson = json.encode(request.toJson());
    return networkLayer.loginUser(requestJson, "");
  }

  @override
  saveUserCredentials({@required LoginResponse credentials}) {
    sharedPreferencesLayer.setUserFullName(credentials.name);
    sharedPreferencesLayer.setUserProfileImage(credentials.imageUrl);
    sharedPreferencesLayer.setUserToken(credentials.token);
    sharedPreferencesLayer.setUserJobTitle(credentials.title);
  }
}
