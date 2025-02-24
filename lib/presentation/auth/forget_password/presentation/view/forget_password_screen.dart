
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
import 'package:live_tv/utils/value/constrant/value.dart';
import 'package:live_tv/utils/value/style/text_style.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetBinding().dependencies();
    final forgetController=Get.find<ForgetPasswordController>();
return Scaffold(
    backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VerticalSpace(height: 70),
                CustomBackButton(onPressed: (){
                  Navigator.pop(context);
                }),
                const VerticalSpace(height: 50.0),
              const Text(
                'Email Address',
                style: pageHeaderTextStyle,
              ),
                const VerticalSpace(height: 8.0),
                const Text("Enter your email address to reset Password",style: fontsize17WithGrayColorTextStyle,),
                const VerticalSpace(height: 22.0),
                Form(
                  key: forgetController.forgetformkey,
                  child: CustomTextFieldWidget(
                                    validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    if (validateEmail(value) == false) {
                      return 'Invalid Email Address';
                    }
                  } else {
                    return 'Please enter your email address';
                  }
                  return null;
                                },
                  controller: forgetController.emailController,
                  iconData: Icons.email_outlined, labelText: "Email Address"),
                ),
                const VerticalSpace(height: 20.0),
                
               CustomButton(txt: 'Continue',ontap: ()async{

                if(forgetController.forgetformkey.currentState!.validate()){
                final code=await forgetController.getCode(forgetController.emailController.text.trim());
                print(code["code"]);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpverifyScreen(code: code["code"].toString(),email: code["email"].toString(),)));
                }
               },),
               const VerticalSpace(height: 40.0),
                
              
            ],
          ),
        ),
      ),
    );
  }
}
