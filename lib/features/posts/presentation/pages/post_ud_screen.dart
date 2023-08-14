import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/post.dart';
import '../getx/post ud/controllers/postud_controller.dart';

class PostUdScreen extends StatelessWidget {
  PostUdScreen({super.key});
  static const String routeName = '/postUd';
  PostUdController get controller => Get.find<PostUdController>();

  Post post = Get.arguments['post'];
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Ud'),
      ),
      body: Center(
        child: Column(children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: "Title"),
          ),
          TextField(
            controller: bodyController,
            decoration: InputDecoration(hintText: "Body"),
            maxLines: 6,
          ),
          ElevatedButton(
              onPressed: () {
                Post udpost = Post(
                  id: post.id,
                  title: titleController.text,
                  body: bodyController.text,
                  userId: post.userId,
                );
                controller.updatePost(
                  udpost,
                );
                Get.showSnackbar(GetSnackBar(
                  message: 'Post Updated',
                  duration: const Duration(seconds: 2),
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.green,
                ));
              },
              child: const Text('Update'))
        ]),
      ),
    );
  }
}
