


import 'package:flutter/material.dart';
import 'package:live_tv/presentation/home/presentation/view/home_page.dart';
import 'package:live_tv/utils/value/colors/colors.dart';



class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Homepage()), (route) => false);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Circular green background with check icon
              Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(20),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              const SizedBox(height: 20),
              // Success message
              const Text(
                'Successful !!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryWhiteColor
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Your payment was done successfully',
                style: TextStyle(
                  fontSize: 16,
                                    color: AppColors.primaryWhiteColor
                ),
              ),
              const SizedBox(height: 50),
              // OK button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Homepage()), (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent, // background color
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
