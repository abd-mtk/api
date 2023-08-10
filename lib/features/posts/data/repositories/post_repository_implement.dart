import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/post.dart';
import '../../domain/repositories/post_repositories.dart';
// import '../datasources/local_data_source.dart';
// import '../datasources/remot_data_source.dart';

typedef DeleteOrUpdateOrAddPost = Future<Unit> Function();

class PostsRepositoryImplement implements PostsRepository {
  // final RemoteDataSource remoteDataSource;
  // final LocalDataSource localDataSource;

  @override
  Future<Either<Failure, Post>> createPost(Post post) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Post>> getPost(int id) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Post>>> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Post>> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
