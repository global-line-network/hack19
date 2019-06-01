import 'package:flutter/foundation.dart';

class LoginRequest {
//  public static final Pattern VALID_EMAIL_ADDRESS_REGEX =
//  Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);

  static const int PASSWORD_LENGTH_MIN = 6;
  static const int PASSWORD_LENGTH_MAX = 20;
  final String username;
  final String password;

  LoginRequest({@required this.username, @required this.password});

  bool isEmptyPassword() {
    return password != null || password != "";
  }

  bool isEmptyUsername() {
    return username != null || username != "";
  }

  bool isPasswordNotInRange() {
    return password.length > PASSWORD_LENGTH_MAX ||
        password.length < PASSWORD_LENGTH_MIN;
  }

//  bool isEmailNotInCorrectFormat(){
//    //return !Patterns.EMAIL_ADDRESS.matcher(Strings.nullToEmpty(username)).matches();
//    return ! VALID_EMAIL_ADDRESS_REGEX .matcher(Strings.nullToEmpty(username)).find();
//  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}

class LoginResponse {
  String imageUrl;
  String name;
  String title;
  String token;

  LoginResponse(this.imageUrl, this.name, this.title, this.token);

  LoginResponse.fromJson(Map<String, dynamic> json)
      : imageUrl = json["imageUrl"],
        name = json["name"],
        title = json["title"],
        token = json["token"];
}
