import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repositories.dart';

class GetPostUsecase {
  final PostsRepository repository;

  GetPostUsecase(this.repository);

  Future<Either<Failure, Post>> call(int postId) async {
    return await repository.getPost(postId);
  }
}
