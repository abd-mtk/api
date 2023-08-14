import 'package:get/get.dart';

import '../../../../../../app/core/error/fun.dart';
import '../../../../domain/entities/post.dart';
import '../../../../domain/usecases/delete_post.dart';
import '../../../../domain/usecases/update_post.dart';

class PostUdController extends GetxController {
  final DeletePostUsecase deletePostUsecase;
  final UpdatePostUsecase updatePostUsecase;
  PostUdController(
    this.deletePostUsecase,
    this.updatePostUsecase,
  );

  RxBool isLoading = false.obs;
  RxString error = ''.obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> deletePost(int id) async {
    isLoading.value = true;
    final result = await deletePostUsecase(id);
    result.fold(
      (failure) {
        error.value = mapFailureToMessage(failure);
        isLoading.value = false;
      },
      (_) {
        isLoading.value = false;
      },
    );
  }

  Future<void> updatePost(Post post) async {
    isLoading.value = true;
    final result = await updatePostUsecase(post);
    result.fold(
      (failure) {
        error.value = mapFailureToMessage(failure);
        isLoading.value = false;
      },
      (data) {
        isLoading.value = false;
        post = data;
      },
    );
  }
}
