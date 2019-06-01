import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREF_CREDENTIAL_USER_TOKEN_FCM = "UserTokenFCM";
const String PREF_CREDENTIAL_USER_TOKEN = "UserToken";
const String PREF_CREDENTIAL_EMAIL = "EmailCredential";
const String PREF_CREDENTIAL_PASSWORD = "PasswordCredential";
const String PREF_CREDENTIAL_PROFILE_IMAGE_URL = "userProfileImageUrl";
const String PREF_CREDENTIAL_USER_FULL_NAME = "userFullName";
const String PREF_CREDENTIAL_USER_DESIGNATION = "userDesignation";
const String PREF_SETTINGS_SELECTED_LANGUAGE = "userSelectedLanguage";

abstract class SharedPreferencesLayer {
  setUserProfileImage(String imageUrl);
  Future<String> getUserProfileImage();

  setUserToken(String token);
  Future<String> getUserToken();

  setUserFullName(String fullName);
  Future<String> getUserFullName();

  setUserJobTitle(String jobTitle);
  Future<String> getUserJobTitle();
}

class SharedPreferencesLayerImpl implements SharedPreferencesLayer {
  final Future<SharedPreferences> prefs;

  SharedPreferencesLayerImpl({@required this.prefs}) : assert(prefs != null);

  @override
  Future<String> getUserProfileImage() async {
    final SharedPreferences pref = await prefs;
    return pref.getString(PREF_CREDENTIAL_PROFILE_IMAGE_URL);
  }

  @override
  Future<String> getUserToken() async {
    final SharedPreferences pref = await prefs;
    return pref.getString(PREF_CREDENTIAL_USER_TOKEN);
  }

  @override
  setUserProfileImage(String imageUrl) async {
    final SharedPreferences pref = await prefs;
    return pref.setString(PREF_CREDENTIAL_PROFILE_IMAGE_URL, imageUrl);
  }

  @override
  setUserToken(String token) async {
    final SharedPreferences pref = await prefs;
    return pref.setString(PREF_CREDENTIAL_USER_TOKEN, token);
  }

  @override
  Future<String> getUserFullName() async {
    final SharedPreferences pref = await prefs;
    return pref.getString(PREF_CREDENTIAL_USER_FULL_NAME);
  }

  @override
  setUserFullName(String fullName) async {
    final SharedPreferences pref = await prefs;
    return pref.setString(PREF_CREDENTIAL_USER_FULL_NAME, fullName);
  }

  @override
  Future<String> getUserJobTitle() async {
    final SharedPreferences pref = await prefs;
    return pref.getString(PREF_CREDENTIAL_USER_DESIGNATION);
  }

  @override
  setUserJobTitle(String jobTitle) async {
    final SharedPreferences pref = await prefs;
    return pref.setString(PREF_CREDENTIAL_USER_DESIGNATION, jobTitle);
  }
}
