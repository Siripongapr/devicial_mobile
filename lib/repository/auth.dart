import 'dart:convert';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:devicial_mobile/models/users.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

String ip = '192.168.0.101';

class Auth {
  late Dio dio;
  late PersistCookieJar cookieJar;

  Auth._privateConstructor() {
    _init();
  }

  static final Auth _instance = Auth._privateConstructor();

  factory Auth() {
    return _instance;
  }

  Future<void> _init() async {
    cookieJar = await _getCookieJar();
    dio = Dio();
    dio.interceptors.add(CookieManager(cookieJar));
  }

  Future<PersistCookieJar> _getCookieJar() async {
    var appDocDir = await _getApplicationDocumentsDirectory();
    var cookiePath = '${appDocDir.path}/cookies';
    return PersistCookieJar(storage: FileStorage(cookiePath));
  }

  Future<Directory> _getApplicationDocumentsDirectory() async {
    return await getApplicationDocumentsDirectory();
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
      // Check if cookies are set and print them

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
      List<Cookie> cookies =
          await cookieJar.loadForRequest(Uri.parse('http://$ip:3000/info'));
      print('Cookies after info:');
      for (var cookie in cookies) {
        print('${cookie.name}: ${cookie.value}');
      }
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
      throw Exception('Failed to register: $e');
    }
  }

  Future logout() async {
    try {
      var response = await dio.get(
        'http://$ip:3000/logout',
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
