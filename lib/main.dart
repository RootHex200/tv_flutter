import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/splash/splash_screen.dart';
import 'package:live_tv/utils/value/colors/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BioScope Box',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryAppBlueColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
