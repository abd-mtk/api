import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/posts/controllers/posts_controller.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});
  static const String routeName = '/posts';
  PostsController get controller => Get.find<PostsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.error.value.isNotEmpty) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          return ListView.builder(
            itemCount: controller.posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.posts[index].id.toString()),
                subtitle: Text(controller.posts[index].body),
                onTap: () {
                  Get.toNamed('/post-detail', arguments: {
                    'id': controller.posts[index].id,
                  });
                },
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/post-cud');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
