import 'package:dartz/dartz.dart';
import '../../../../app/core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repositories.dart';

class GetPostsUsecase{
  final PostsRepository repository;

  GetPostsUsecase(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getPosts();
  }
}