
import 'package:flutter/material.dart';
import 'package:live_tv/utils/value/colors/colors.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final void Function()? ontap;
  const CustomButton({super.key,required this.txt,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 55,
        decoration:  BoxDecoration(
          color: AppColors.primaryAppBlueColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text(txt,style: const TextStyle(color: AppColors.primaryWhiteColor,fontSize: 20,fontWeight: FontWeight.bold),),),
      ),
    );
  }
}
