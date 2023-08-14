import 'package:get/get.dart';

import '../getx/post ud/Bindings/postud_bindings.dart';
import '../getx/posts/Bindings/posts_binding.dart';
import 'post_detail_screen.dart';
import 'post_ud_screen.dart';
import 'posts_screen.dart';

List<GetPage> posts = [
  GetPage(
      name: PostsScreen.routeName,
      page: () => const PostsScreen(),
      binding: PostBinding()),
  GetPage(
      name: PostDetailScreen.routeName, page: () => const PostDetailScreen()),
  GetPage(name: PostUdScreen.routeName, page: () => PostUdScreen(), binding: PostUdBindings()),
];
