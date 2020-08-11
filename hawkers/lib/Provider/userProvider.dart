import 'dart:convert';

import 'package:hawkers/Services/restApi.dart';
import 'package:hawkers/Utility/UserData.dart';
import 'package:flutter/material.dart';
import 'package:hawkers/Models/user.dart' as UserModel;
import 'package:shared_preferences/shared_preferences.dart';


class User with ChangeNotifier {
  RestApi restApi = RestApi();

  User();

  Future<UserModel.User> login(String body) async {
    try {
      final response = await restApi.login(body);
      UserModel.User loginResponse = UserModel.userFromJson(response.body);
      print("loginResponse: $loginResponse");
      UserData.user = loginResponse;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userData', json.encode(UserData.user.toJson()));
      return loginResponse;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel.User> register(String body) async {
    try {
      final response = await restApi.register(body);
      UserModel.User loginResponse = UserModel.userFromJson(response.body);
      UserData.user = loginResponse;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userData', json.encode(UserData.user.toJson()));
      return loginResponse;
    } catch (e) {
      throw e;
    }
  }
}