import 'package:dartz/dartz.dart';

import '../../../../app/core/error/failures.dart';
import '../entities/post.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getPosts();
  Future<Either<Failure, Post>> getPost(int id);
  Future<Either<Failure, Post>> createPost(Post post);
  Future<Either<Failure, Post>> updatePost(Post post);
  Future<Either<Failure, Unit>> deletePost(int id);
}
