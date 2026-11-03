import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/post.dart';
import 'models/user.dart';

class Api {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<dynamic>> _get(String path) async {
    final response = await http.get(Uri.parse('$baseUrl$path'));
    if (response.statusCode != 200) {
      throw Exception('Error ${response.statusCode}');
    }
    return jsonDecode(response.body);
  }

  static Future<List<User>> getUsers() async {
    final data = await _get('/users');
    return data.map((e) => User.fromJson(e)).toList();
  }

  static Future<List<Post>> getPosts() async {
    final data = await _get('/posts');
    return data.map((e) => Post.fromJson(e)).toList();
  }
}
