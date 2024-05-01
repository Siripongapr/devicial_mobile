import 'dart:convert';

import 'package:devicial_mobile/models/post.dart';
import 'package:devicial_mobile/repository/auth.dart';
import 'package:dio/dio.dart';

class Post {
  Auth auth;
  late Dio dio;
  bool _isDioInitialized = false; // Add a flag to track initialization
  Post(this.auth) {
    _initializeDio();
  }

  Future<void> _initializeDio() async {
    await auth.init(); // Call the init method instead
    dio = auth.getDioInstance();
    _isDioInitialized = true; // Set flag to true after initialization
  }

  // Add a private method to ensure dio is initialized before accessing
  Future<void> _ensureDioInitialized() async {
    if (!_isDioInitialized) {
      await _initializeDio();
    }
  }

  Future createPost(String title, String content) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var data = json.encode({
      "title": title,
      "contents": [
        {"type": "text", "content": content}
      ]
    });
    try {
      var response = await dio.request(
        'http://$ip:3000/create-post',
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
      throw Exception('Failed to create post');
    }
  }

  Future<List<PostModel>> getAllPosts() async {
    await _ensureDioInitialized();
    try {
      var response = await dio.get(
        'http://$ip:3000/posts',
      );

      if (response.statusCode == 200) {
        // Map the response data to a list of PostModel objects
        List<PostModel> posts = (response.data as List)
            .map((json) => PostModel.fromJson(json))
            .toList();
        return posts;
      } else {
        print(response.statusMessage);
        throw Exception('Failed to fetch posts');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to fetch posts');
    }
  }

  Future viewPost(String postId) async {
    await _ensureDioInitialized();

    try {
      var response = await dio.get(
        'http://$ip:3000/posts/$postId',
      );

      if (response.statusCode == 200) {
        var viewPost = ViewPost.fromJson(json.decode(response.data));
        print(viewPost.title);
        print(viewPost.date);
        print(viewPost.user.username);
        // You can access other properties similarly
      } else {
        print("response : ${response.statusMessage}");
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to fetch post');
    }
  }
}
