import 'package:get/get.dart';

import '../../../../../../app/util/services.dart';
import '../../../../data/repositories/post_repository_implement.dart';
import '../../../../domain/usecases/get_posts.dart';
import '../controllers/posts_controller.dart';

class PostBinding extends Bindings {
  Services services = Get.find();
  @override
  void dependencies() {
    Get.lazyPut<PostsController>(() {
      final repository = PostsRepositoryImplement(
          localDataSource: services.localDataSource,
          networkInfo: services.networkInfo,
          remoteDataSource: services.remoteDataSource);
      final usecase = GetPostsUsecase(repository);
      return PostsController(usecase);
    });
  }
}
