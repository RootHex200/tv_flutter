
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/forget_password/presentation/controller/forget_password_binding.dart';
import 'package:live_tv/presentation/auth/forget_password/presentation/controller/forget_password_controller.dart';
import 'package:live_tv/presentation/auth/otp_verify/presentation/views/opt_verify_screen.dart';
import 'package:live_tv/presentation/auth/reset_password/presentation/views/reset_password_screen.dart';
import 'package:live_tv/utils/common/widgets/back_button/back_button.dart';
import 'package:live_tv/utils/common/widgets/button/custom_buttom.dart';
import 'package:live_tv/utils/common/widgets/space/space.dart';
import 'package:live_tv/utils/common/widgets/text_field/custom_text_field.dart';
import 'package:live_tv/utils/value/colors/colors.dart';
import 'package:live_tv/utils/value/style/text_style.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetBinding().dependencies();
    final forgetController=Get.find<ForgetPasswordController>();
return Scaffold(
    backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VerticalSpace(height: 70),
                CustomBackButton(onPressed: (){}),
                const VerticalSpace(height: 50.0),
              const Text(
                'Email Address',
                style: pageHeaderTextStyle,
              ),
                const VerticalSpace(height: 8.0),
                const Text("Enter your email address to reset Password",style: fontsize17WithGrayColorTextStyle,),
                const VerticalSpace(height: 22.0),
                CustomTextFieldWidget(
                controller: forgetController.emailController,
                iconData: Icons.email_outlined, labelText: "Email Address"),
                const VerticalSpace(height: 20.0),
                
               CustomButton(txt: 'Continue',ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const OtpverifyScreen()));
               },),
               const VerticalSpace(height: 40.0),
                
              
            ],
          ),
        ),
      ),
    );
  }
}
