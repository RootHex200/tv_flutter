

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:live_tv/presentation/auth/reset_password/presentation/views/reset_password_screen.dart';
import 'package:live_tv/utils/common/widgets/back_button/back_button.dart';
import 'package:live_tv/utils/common/widgets/space/space.dart';
import 'package:live_tv/utils/value/colors/colors.dart';
import 'package:live_tv/utils/value/style/text_style.dart';

class OtpverifyScreen extends StatelessWidget {
  final String code;
  final String email;
  const OtpverifyScreen({super.key,required this.code,required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VerticalSpace(height: 80),
              CustomBackButton(onPressed: (){}),
              const VerticalSpace(height: 50.0),
              const Text(
                'Enter OTP Code',
                style: pageHeaderTextStyle,
              ),
              const VerticalSpace(height: 8.0),
              const Text(
                "Type OTP Code that send to your email.",
                style: fontsize17WithGrayColorTextStyle,
              ),
              const VerticalSpace(height: 22.0),
              OtpTextField(
                
                fieldHeight: 80.0,
                fieldWidth: 60.0,
                filled: true,
                textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                fillColor: AppColors.primaryWhiteColor,
                numberOfFields: 4,
                enabledBorderColor: AppColors.primaryAppRedColor,
                focusedBorderColor: AppColors.primaryAppRedColor,
                disabledBorderColor: AppColors.primaryAppRedColor,
                borderColor: AppColors.primaryAppRedColor,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                onSubmit: (String optcode){
                  if(optcode==code){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPasswordScreen(code: code,email: email,)));
                  }
                },
                //runs when every textfield is filled // end onSubmit
              ),
              // const VerticalSpace(height: 20.0),
              // CustomButton(
              //   txt: 'Continue',
              //   ontap: () {
                  
              //     Navigator.push(context, MaterialPageRoute(builder: (context)=>const Homepage()));
              //   },
              // ),
              const VerticalSpace(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
