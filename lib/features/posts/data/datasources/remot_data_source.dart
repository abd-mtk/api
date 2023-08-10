import 'package:dartz/dartz.dart';

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
  Future<PostModel> getPost(int id) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }

  @override
  Future<PostModel> updatePost(PostModel post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

}