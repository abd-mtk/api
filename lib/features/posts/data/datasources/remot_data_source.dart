import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/post_model.dart';

abstract class RemoteDataSource {
  Future<List<PostModel>> getPosts();
  Future<PostModel> getPost(int id);
  Future<PostModel> createPost(PostModel post);
  Future<PostModel> updatePost(PostModel post);
  Future<Unit> deletePost(int id);
}

const String BASE_URL = 'https://jsonplaceholder.typicode.com/';

class RemoteDataSourceImplement implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImplement({required this.client});
  @override
  Future<List<PostModel>> getPosts() async {
    final response = await client.get(Uri.parse('${BASE_URL}posts'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      if (decodedJson.isEmpty) {
        throw ServerException();
      }
      final List<PostModel> posts =
          decodedJson.map((e) => PostModel.fromJson(e)).toList();
      return posts;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> getPost(int id) async {
    final response = await client.get(Uri.parse('${BASE_URL}posts/$id'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      if (decodedJson.isEmpty) {
        throw ServerException();
      }
      final PostModel post = PostModel.fromJson(decodedJson);
      return post;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> createPost(PostModel post) async {
    final response = await client.post(Uri.parse('${BASE_URL}posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(post.toJson()));
    if (response.statusCode == 201) {
      return PostModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(int id) async {
    final response = await client.delete(Uri.parse('${BASE_URL}posts/$id'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> updatePost(PostModel post) async {
    final response = await client.put(Uri.parse('${BASE_URL}posts/${post.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(post.toJson()));
    if (response.statusCode == 200) {
      return PostModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
