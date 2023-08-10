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
      final List<PostModel> posts =
          decodedJson.map((e) => PostModel.fromJson(e)).toList();
      return posts;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PostModel> getPost(int id) {
    // TODO: implement getPost

    throw UnimplementedError();
  }

  @override
  Future<PostModel> createPost(PostModel post) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<PostModel> updatePost(PostModel post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
