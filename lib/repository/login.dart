import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class Login {
  var dio = Dio();
  Login() {
    var cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
  }
  Future login() async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var data = json.encode({"username": "app_test1", "password": "123456"});
    try {
      var response = await dio.request(
        'http://192.168.0.100:3000/login',
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

  Future getInfo() async {
    var response = await dio.request(
      'http://192.168.0.100:3000/info',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }
}
