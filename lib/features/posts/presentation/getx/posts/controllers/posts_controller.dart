import 'package:get/get.dart';

import '../../../../domain/usecases/get_posts.dart';

class PostsController extends GetxController {
  GetPostsUsecase getPostsUsecase;
  PostsController(this.getPostsUsecase);
  RxBool isLoading = false.obs;
  RxList posts = [].obs;
  RxString error = ''.obs;

  Future<void> getPosts() async {
    isLoading.value = true;
    final result = await getPostsUsecase.call();
    isLoading.value = false;
    result.fold(
        (failure) => error.value = "Error",
        (data) => {
              // print(data),
              posts.value = data,
            });
  }

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }
}
