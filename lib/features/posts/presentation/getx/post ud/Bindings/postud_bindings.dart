import 'package:get/get.dart';

import '../../../../../../app/util/services.dart';
import '../../../../data/repositories/post_repository_implement.dart';
import '../../../../domain/usecases/delete_post.dart';
import '../../../../domain/usecases/update_post.dart';
import '../controllers/postud_controller.dart';

class PostUdBindings implements Bindings {
  Services services = Get.find();
  @override
  void dependencies() {
    Get.lazyPut<PostUdController>(() {
      final repository = PostsRepositoryImplement(
          localDataSource: services.localDataSource,
          networkInfo: services.networkInfo,
          remoteDataSource: services.remoteDataSource);
      final deletePostUsecase = DeletePostUsecase(repository);
      final updatePostUsecase = UpdatePostUsecase(repository);
      return PostUdController(
        deletePostUsecase,
        updatePostUsecase,
      );
    });
  }
}
