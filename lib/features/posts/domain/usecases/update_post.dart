import 'package:dartz/dartz.dart';

import '../../../../app/core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repositories.dart';

class UpdatePostUsecase {
  final PostsRepository repository;

  UpdatePostUsecase(this.repository);

  Future<Either<Failure, Post>> call(Post post) async {
    return await repository.updatePost(post);
  }
}
