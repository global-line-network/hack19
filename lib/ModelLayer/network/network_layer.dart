import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hack19/ModelLayer/exceptions/fetch_data_exception.dart';
import 'package:hack19/ModelLayer/model/login.dart';
import 'package:http/http.dart' show Client;

import '../exceptions/unauthorized_user_exception.dart';

abstract class NetworkLayer {
  Future<LoginResponse> loginUser(String encodedJsonRequest, String fcmToken);
}

class NetworkLayerImpl implements NetworkLayer {
  final Client client;

  static const String BASE_URL = "http://lidev.chimaera.my:8080/mswinklyapi";

  static const int UNAUTHORIZED_ACCESS = 78;

  NetworkLayerImpl({@required this.client}) : assert(client != null);

  _handleServerError(Map<String, dynamic> errorJson) {
    final int errorCode = errorJson["code"] ?? 0;
    final String errorMessage = errorJson["message"] ?? "";

    if (errorCode == UNAUTHORIZED_ACCESS) {
      throw UnAuthorizedUserException(errorMessage, errorCode);
    } else {
      throw FetchDataException(errorMessage, errorCode);
    }
  }

  @override
  Future<LoginResponse> loginUser(
      String encodedJsonRequest, String fcmToken) async {
    print("login request : $encodedJsonRequest");

    final url = "$BASE_URL/login";
    final header = {
      HttpHeaders.contentTypeHeader: "application/json",
      "fcmToken": fcmToken
    };

    try {
      var response =
          await client.post(url, body: encodedJsonRequest, headers: header);

      // get the response in JSON format
      final jsonResponse = json.decode(response.body);

      print("login json response : ${jsonResponse.toString()}");

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        // If server returns an OK response, parse the JSON

        if (jsonResponse["success"]) {
          final loginResponse = LoginResponse.fromJson(jsonResponse["data"]);

          return loginResponse;
        } else {
          _handleServerError(jsonResponse["error"]);
        }
      } else {
        // If that response was not OK, throw an error.
        throw FetchDataException("Cannot fetch Data!", 0);
      }
    } on SocketException catch (exception) {
      throw FetchDataException(exception.message, 0);
    } catch (exception) {
      throw FetchDataException(exception.message, 0);
    }
  }
}
