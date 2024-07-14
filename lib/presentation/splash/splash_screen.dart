
import 'package:flutter/material.dart';
import 'package:live_tv/presentation/home/presentation/view/home_page.dart';
import 'package:live_tv/utils/value/colors/colors.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Homepage()), (route) => false);
    });

    return Scaffold(
      backgroundColor: AppColors.primaryAppBlueColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
        ),
        child:  Center(
          child: Container(
            height: 200,
            width: 200,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              image: const DecorationImage(image: AssetImage("assets/images/app_logo.png"))
            ),
            ),
        ),
      ),
    );
  }
}