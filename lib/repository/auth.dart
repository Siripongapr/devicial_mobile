import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:devicial_mobile/models/users.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

String ip = '192.168.0.100';

class Auth {
  var dio = Dio();
  Auth() {
    var cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
  }
  Future login(String username, String password) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var data = json.encode({"username": username, "password": password});
    try {
      var response = await dio.request(
        'http://$ip:3000/login',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<UserModel> getInfo() async {
    try {
      var response = await dio.request(
        'http://$ip:3000/info',
        options: Options(
          method: 'GET',
        ),
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
      return UserModel.fromJson(response.data);
    } catch (e) {
      print(e);
      throw Exception('Failed to load user data');
    }
  }

  Future register(String username, String password, String email, String gender,
      String birthDate) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var data = json.encode({
      "username": username,
      "password": password,
      "email": email,
      "gender": gender,
      "birth_date": birthDate
    });
    try {
      var response = await dio.request(
        'http://$ip:3000/register',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print(e);
    }
  }
}
