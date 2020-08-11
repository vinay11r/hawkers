import 'dart:convert';

import 'package:hawkers/Utility/userData.dart';
import 'package:http/http.dart' as http;
class RestApi {
  RestApi();

  Future<http.Response> register(String body) async {
    try {
      final response = await http.post(
        '${"http://localhost:4000"}/auth/v0/signup',
        body: body,
        headers: <String, String>{
          'content-type': "application/json",
          //  "origin": Constants.tenantUrl
        },
      );
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<http.Response> login(String body) async {
    try {
      print("body: $body");
      print('baseUrl: ${"http://localhost:4000"}');
      final response = await http.post(
        '${ "http://localhost:4000"}/auth/v0/signIn',
        body: body,
        headers: <String, String>{
          'content-type': "application/json",
          //   "origin": Constants.tenantUrl
        },
      );
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}