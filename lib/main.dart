import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/app_theme.dart';
import 'app/util/services.dart';
import 'features/posts/presentation/getx/posts/Bindings/posts_binding.dart';
import 'features/posts/presentation/pages/post_rout.dart';
import 'features/posts/presentation/pages/posts_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

Future initServices() async {
  await Get.putAsync(() => Services().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture ',
      theme: appTheme,
      initialRoute: PostsScreen.routeName,
      initialBinding: PostBinding(),
      getPages: [
        ...posts,
      ],
    );
  }
}
