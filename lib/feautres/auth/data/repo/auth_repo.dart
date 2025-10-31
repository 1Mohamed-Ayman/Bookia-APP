import 'dart:developer';

import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/feautres/auth/data/models/auth_parames.dart';
import 'package:bookia/feautres/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/core/services/dio/api_endpoints.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';

class AuthRepo {
  static Future<AuthResponse?> register(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.register,
        data: params.toJson(),
      );
      if (res.statusCode == 201) {
        //Parse Data Json to Object
        //success
        var body = res.data;
        var userObj = AuthResponse.fromJson(body);
        //Store User Data in SharedPref
        SharedPref.saveUserData(userObj.data);
        return userObj;
      } else {
        //error
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.login,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        //success
        var body = res.data;
        var userObj = AuthResponse.fromJson(body);
        //Store User Data in SharedPref
        SharedPref.saveUserData(userObj.data);
        return AuthResponse.fromJson(body);
      } else {
        //error
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
