import 'package:devicial_mobile/models/users.dart';

class PostModel {
  final int id;
  final UserModel user;
  final String title;
  final DateTime date;
  final List<PostContent> contents;
  final List<dynamic> views; // Assuming views is a list of dynamic type
  final List<dynamic> likes; // Assuming likes is a list of dynamic type

  PostModel({
    required this.id,
    required this.user,
    required this.title,
    required this.date,
    required this.contents,
    required this.views,
    required this.likes,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      user: UserModel.fromJson(json['user']),
      title: json['title'],
      date: DateTime.parse(json['date']),
      contents: (json['contents'] as List<dynamic>)
          .map((contentJson) => PostContent.fromJson(contentJson))
          .toList(),
      views: json['views'], // Adjust if views is of a specific type
      likes: json['likes'], // Adjust if likes is of a specific type
    );
  }
}

class PostContent {
  final int id;
  final int postId;
  final String type;
  final String content;

  PostContent({
    required this.id,
    required this.postId,
    required this.type,
    required this.content,
  });

  factory PostContent.fromJson(Map<String, dynamic> json) {
    return PostContent(
      id: json['id'],
      postId: json['post_id'],
      type: json['type'],
      content: json['content'],
    );
  }
}

class ViewPost {
  final int id;
  final int userId;
  final String title;
  final DateTime date;
  final UserModel user;
  final List<PostContent>
      contents; // Update to use PostContent instead of String
  final List<dynamic> comments;
  final List<dynamic> likes;
  final List<View> views;

  ViewPost({
    required this.id,
    required this.userId,
    required this.title,
    required this.date,
    required this.user,
    required this.contents,
    required this.comments,
    required this.likes,
    required this.views,
  });

  factory ViewPost.fromJson(Map<String, dynamic> json) {
    return ViewPost(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      date: DateTime.parse(json['date']),
      user: UserModel.fromJson(json['user']),
      contents: (json['contents'] as List<dynamic>)
          .map((contentJson) => PostContent.fromJson(contentJson))
          .toList(),
      comments: json['comments'] ?? [],
      likes: json['likes'] ?? [],
      views: (json['views'] as List<dynamic>)
          .map((viewJson) => View.fromJson(viewJson))
          .toList(),
    );
  }
}

class View {
  final int id;
  final int postId;
  final int viewerId;
  final DateTime createdAt;

  View({
    required this.id,
    required this.postId,
    required this.viewerId,
    required this.createdAt,
  });

  factory View.fromJson(Map<String, dynamic> json) {
    return View(
      id: json['id'],
      postId: json['post_id'],
      viewerId: json['viewer_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
