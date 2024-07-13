
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/forget_password/presentation/view/forget_password_screen.dart';
import 'package:live_tv/presentation/auth/login/presentation/controller/login_binding.dart';
import 'package:live_tv/presentation/auth/login/presentation/controller/login_controller.dart';
import 'package:live_tv/presentation/auth/otp_verify/presentation/views/opt_verify_screen.dart';
import 'package:live_tv/presentation/auth/registration/presentation/views/registration_screen.dart';
import 'package:live_tv/presentation/home/presentation/view/home_page.dart';
import 'package:live_tv/utils/common/widgets/back_button/back_button.dart';
import 'package:live_tv/utils/common/widgets/button/custom_buttom.dart';
import 'package:live_tv/utils/common/widgets/space/space.dart';
import 'package:live_tv/utils/common/widgets/text_field/custom_text_field.dart';
import 'package:live_tv/utils/value/colors/colors.dart';
import 'package:live_tv/utils/value/style/text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginBinding().dependencies();
    final loginController=Get.find<LoginController>();
return Scaffold(
  backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VerticalSpace(height: 80),
                CustomBackButton(onPressed: (){}),
                const VerticalSpace(height: 50.0),
              const Text(
                'Sign In',
                style: pageHeaderTextStyle,
              ),
                const VerticalSpace(height: 30.0),
                CustomTextFieldWidget(
               
                  controller: loginController.emailController,
                  iconData: Icons.email, labelText: "Phone Number"),
                const VerticalSpace(height: 20.0),
               CustomTextFieldWidget(
                controller: loginController.passwordController,
                suffixIcon: const Icon(Icons.visibility_off),
                iconData: Icons.lock_outline, labelText: "Password"),
                const VerticalSpace(height: 20.0),
                 Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgetPasswordScreen()));
                    },
                    child: const Text("Forgot password?",style: TextStyle(color: AppColors.textGrayColor,fontWeight: FontWeight.w500,fontSize: 17),)),
                ),
                                const VerticalSpace(height: 20.0),
                
               CustomButton(txt: 'Sign In',ontap: ()async{
                  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                  final devicename=androidInfo.model;
                  final id=androidInfo.id;
                final response=await loginController.userLoginController(devicename, loginController.emailController.text, id, loginController.passwordController.text);
                print(response);
                if(response==true){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Homepage()), (route) => false);
                }
               },),
               const VerticalSpace(height: 40.0),
                              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Haven’t any account?",style: haveAccountTextStyle),
                    const HorizontalSpace(width: 10),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegistrationScreen()));
                      },
                      child: const Text("Create Account",style: redColorSignInTextStyle))
                  ],
                ),
              )
                
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Row(
              //       children: [
              //         Checkbox(
              //           value: false,
              //           onChanged: (newValue) {},
              //         ),
              //         const Text(
              //           'I have read and agree to the website',
              //         ),
              //       ],
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 50),
              //       child: GestureDetector(
              //         onTap: () {
              //           // Handle terms and conditions tap
              //         },
              //         child: const Text(
              //           'terms and condition',
              //           style: termsConditionTextStyle
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
