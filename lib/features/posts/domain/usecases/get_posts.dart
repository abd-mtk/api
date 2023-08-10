import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repositories.dart';

class GetAllPostsUsecase{
  final PostsRepository repository;

  GetAllPostsUsecase(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getPosts();
  }
}