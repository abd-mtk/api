import 'package:get/get.dart';

import '../getx/posts/Bindings/posts_binding.dart';
import 'post_cud_screen.dart';
import 'post_detail_screen.dart';
import 'posts_screen.dart';

List<GetPage> posts = [
  GetPage(name: PostsScreen.routeName, page: () => const PostsScreen(),binding: PostBinding()),
  GetPage(
      name: PostDetailScreen.routeName, page: () => const PostDetailScreen()),
  GetPage(name: PostCudScreen.routeName, page: () => const PostCudScreen()),
];
