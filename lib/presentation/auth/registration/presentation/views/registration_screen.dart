
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/registration/presentation/controller/registration_binding.dart';
import 'package:live_tv/presentation/auth/registration/presentation/controller/registration_controller.dart';
import 'package:live_tv/presentation/home/presentation/view/home_page.dart';
import 'package:live_tv/utils/common/widgets/back_button/back_button.dart';
import 'package:live_tv/utils/common/widgets/button/custom_buttom.dart';
import 'package:live_tv/utils/common/widgets/space/space.dart';
import 'package:live_tv/utils/common/widgets/text_field/custom_text_field.dart';
import 'package:live_tv/utils/value/colors/colors.dart';
import 'package:live_tv/utils/value/style/text_style.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    registrationBinding().dependencies();
    RegistrationController regicontroller=Get.find<RegistrationController>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VerticalSpace(height: 70),
                CustomBackButton(onPressed: (){}),
                const VerticalSpace(height: 30.0),
              const Text(
                'Sign Up',
                style: pageHeaderTextStyle,
              ),
              const VerticalSpace(height: 20.0),
                 CustomTextFieldWidget(
                  controller: regicontroller.fullNameController,
                  iconData: Icons.email_outlined, labelText: "Full Name"),
                const VerticalSpace(height: 20.0),
                       CustomTextFieldWidget(
                        controller: regicontroller.emailController,
                        iconData: Icons.email_outlined, labelText: "Email Address"),
                const VerticalSpace(height: 20.0),
                // CustomTextFieldWidget(
                //   textInputType: TextInputType.phone,
                //   controller: regicontroller.passwordController,
                //   iconData: Icons.phone, labelText: "Phone Number"),
                // const VerticalSpace(height: 20.0),
               CustomTextFieldWidget(
                controller: regicontroller.passwordController,
                suffixIcon: const Icon(Icons.visibility_off),
                iconData: Icons.lock_outline, labelText: "Password"),
                const VerticalSpace(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (newValue) {},
                      ),
                      const Text(
                        'I have read and agree to the website',
                        style: TextStyle(color: AppColors.primaryWhiteColor),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: GestureDetector(
                      onTap: () {
                        // Handle terms and conditions tap
                      },
                      child: const Text(
                        'terms and condition',
                        style: termsConditionTextStyle
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
               CustomButton(txt: 'Sign Up',ontap: ()async{
                final response=await regicontroller.userRegiController(regicontroller.fullNameController.text, regicontroller.emailController.text, regicontroller.passwordController.text);
                print(response);
                if(response==true){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Homepage()), (route) => false);
                }
    //             else{
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Error.Please Try Again'),
    //       duration: Duration(seconds: 3),
    //     ),
    //   );
    // });
    //             }
               },),
              const SizedBox(height: 20.0),
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",style: haveAccountTextStyle),
                    HorizontalSpace(width: 10),
                    Text("Sing In",style: redColorSignInTextStyle)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}