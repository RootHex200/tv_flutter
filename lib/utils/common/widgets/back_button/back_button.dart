
import 'package:flutter/material.dart';
import 'package:live_tv/utils/value/colors/colors.dart';

class CustomBackButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomBackButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: const Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryAppBlueColor,
            ),
            Text(
              "Back",
              style: TextStyle(
                  color: AppColors.primaryAppBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            )
          ],
        ),
      );
  }
}
