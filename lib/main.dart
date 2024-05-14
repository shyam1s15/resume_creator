import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_creator/controllers/routes.dart';
import 'package:resume_creator/pages/splash_screen_page.dart';
import 'package:resume_creator/repositories/database_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //home: OnboardingPage2(),
      initialRoute: Routes.splash,
      getPages: Routes.getPages,
      defaultTransition: Transition.leftToRight,
    );
  }
}

void getDependencies() {
  Get.put(DatabaseHelper()); // Registering DatabaseHelper as a dependency
}