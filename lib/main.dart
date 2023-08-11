import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Clean Architecture'),
        ),
        body: Center(
          child: Container(
            child: Text('Flutter Demo Home Page'),
          ),
        ),
      ),
    );
  }
}
