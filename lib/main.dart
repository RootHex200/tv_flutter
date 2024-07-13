import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/login/presentation/views/login_screen.dart';
import 'package:live_tv/presentation/auth/otp_verify/presentation/views/opt_verify_screen.dart';
import 'package:live_tv/presentation/auth/registration/presentation/views/registration_screen.dart';
import 'package:live_tv/presentation/auth/reset_password/presentation/views/reset_password_screen.dart';
import 'package:live_tv/presentation/details/presentation/view/details_page.dart';
import 'package:live_tv/presentation/home/presentation/view/home_page.dart';
import 'package:live_tv/presentation/profile/presentation/view/profile.dart';
import 'package:live_tv/presentation/splash/splash_screen.dart';
import 'package:live_tv/presentation/subscription/view/presentation/subscription_page.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryAppBlueColor),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}
