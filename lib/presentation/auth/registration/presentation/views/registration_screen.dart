
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/login/presentation/views/login_screen.dart';
import 'package:live_tv/presentation/auth/registration/presentation/controller/registration_binding.dart';
import 'package:live_tv/presentation/auth/registration/presentation/controller/registration_controller.dart';
import 'package:live_tv/presentation/home/presentation/view/home_page.dart';
import 'package:live_tv/utils/common/widgets/back_button/back_button.dart';
import 'package:live_tv/utils/common/widgets/button/custom_buttom.dart';
import 'package:live_tv/utils/common/widgets/space/space.dart';
import 'package:live_tv/utils/common/widgets/text_field/custom_text_field.dart';
import 'package:live_tv/utils/value/colors/colors.dart';
import 'package:live_tv/utils/value/constrant/value.dart';
import 'package:live_tv/utils/value/style/text_style.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    registrationBinding().dependencies();
    RegistrationController regicontroller=Get.find<RegistrationController>();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Form(
            key: regicontroller.regformKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const VerticalSpace(height: 70),
                  CustomBackButton(onPressed: (){
                    Navigator.pop(context);
                  }),
                  const VerticalSpace(height: 30.0),
                const Text(
                  'Sign Up',
                  style: pageHeaderTextStyle,
                ),
                const VerticalSpace(height: 20.0),
                   CustomTextFieldWidget(
                    validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                    controller: regicontroller.fullNameController,
                    iconData: Icons.email_outlined, labelText: "Full Name"),
                  const VerticalSpace(height: 20.0),
                         CustomTextFieldWidget(
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
                          controller: regicontroller.emailController,
                          iconData: Icons.email_outlined, labelText: "Email Address"),
                  const VerticalSpace(height: 20.0),
                 Obx(
                   ()=> CustomTextFieldWidget(
                    validator: (value) {
                      if ((value?.toString().length ?? 0) < 9) {
                        return "Password must be at least 9 characters long.";
                      }
                      return null;
                    },
                    controller: regicontroller.passwordController,
                    obscure: regicontroller.showpassword.value,
                    suffixIcon:  GestureDetector(
                      onTap: (){
                        regicontroller.showpassword.value=!regicontroller.showpassword.value;
                      },
                      child: Icon(regicontroller.showpassword.value?Icons.visibility_off:Icons.visibility)),
                    iconData: Icons.lock_outline, labelText: "Password"),
                 ),
                  const VerticalSpace(height: 20.0),
                const SizedBox(height: 20.0),
                 CustomButton(txt: 'Sign Up',ontap: ()async{
                   if (regicontroller.regformKey.currentState!.validate()){
                  final response=await regicontroller.userRegiController(regicontroller.fullNameController.text, regicontroller.emailController.text, regicontroller.passwordController.text);
                  print(response);
                  if(response==true){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Homepage()), (route) => false);
                  }
                   }

            
                 },),
                const SizedBox(height: 20.0),
                 Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?",style: haveAccountTextStyle),
                      const HorizontalSpace(width: 10),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                        },
                        child: const Text("Sing In",style: redColorSignInTextStyle))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}