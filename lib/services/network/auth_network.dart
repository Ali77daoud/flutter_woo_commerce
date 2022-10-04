import 'dart:convert';
import 'package:flutter_woocommerce/model/auth_models/user_data_model.dart';
import 'package:flutter_woocommerce/utils/strings.dart';
import 'package:http/http.dart' as http;

import '../../model/auth_models/register_model.dart';

class AuthApi {
  //register
  static Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userName,
  }) async {
    final client = http.Client();
    final uri = Uri.parse(
        '$baseUrl/wp-json/wc/v3/customers?consumer_key=$consumerKey&consumer_secret=$consumerSecret');
    var response = await client.post(uri,
        body: RegisterModel(
                password: password,
                email: email,
                firstName: firstName,
                lastName: lastName,
                userName: userName)
            .toJson());

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('register success');
    } else {
      print('register field');
      throw Exception('خطأ في تسجيل الحساب');
    }
  }

  //logIn
  static Future<String> createUserToken({
    required String userName,
    required String password,
  }) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/wp-json/jwt-auth/v1/token');
    var response = await client
        .post(uri, body: {'username': userName, 'password': password});

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var responseData = json.decode(response.body);
      if (responseData != null) {
        print('create token success');
        String token = responseData['token'].toString();
        return token;
      } else {
        print('token data null');
        return throw Exception('خطأ في تسجيل الدخول');
      }

      // throw Exception('Register Success');
    } else {
      print('create token field');
      return throw Exception('خطأ في تسجيل الدخول');
    }
  }

////////////////////////////////////////////////////////////////////////////
  static Future<void> verifyUserToken({required String token}) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/wp-json/jwt-auth/v1/token/validate');
    var response = await client.post(uri, headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('login success');
    } else {
      print('Login field');
      throw Exception('Login Field');
    }
  }

  //// get user data

  static Future<int> getUserId({required String token}) async {
    final client = http.Client();
    final uri = Uri.parse('$baseUrl/wp-json/wp/v2/users/me');
    var response = await client.get(uri, headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var responseData = json.decode(response.body);
      if (responseData != null) {
        print('create id success');
        int id = responseData['id'];
        return id;
      } else {
        print('id data null');
        return throw Exception('id Data Null');
      }
    } else {
      print('get id field');
      throw Exception('Get Id Field');
    }
  }

  /// ///////////////////////////////////////////////////////////////////////////
  static Future<UserDataModel> getUserDataById({required int id}) async {
    final client = http.Client();
    final uri = Uri.parse(
        '$baseUrl/wp-json/wc/v3/customers/$id?consumer_key=$consumerKey&consumer_secret=$consumerSecret');
    var response = await client.get(
      uri,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      var responseData = json.decode(response.body);
      if (responseData != null) {
        print('getUserDataById( success');
        return UserDataModel.fromJson(responseData);
      } else {
        print('getUserDataById null');
        throw Exception('getUserDataById null');
      }
    } else {
      print('getUserDataById field');
      throw Exception('getUserDataById Field');
    }
  }
}
