import 'package:dartz/dartz.dart';

import '../models/post_model.dart';

abstract class LocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModels);
}

const String CACHED_POSTS = "CACHED_POSTS";

class LocalDataSourceImplement implements LocalDataSource {
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    // TODO: implement cachePosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    // TODO: implement getCachedPosts
    throw UnimplementedError();
  }
}
