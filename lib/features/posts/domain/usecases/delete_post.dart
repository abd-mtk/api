import 'package:dartz/dartz.dart';

import '../../../../app/core/error/failures.dart';
import '../repositories/post_repositories.dart';

class DeletePostUsecase {
  final PostsRepository repository;

  DeletePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int postId) async {
    return await repository.deletePost(postId);
  }
}
