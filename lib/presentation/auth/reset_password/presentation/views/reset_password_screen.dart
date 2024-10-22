
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/login/presentation/views/login_screen.dart';
import 'package:live_tv/presentation/auth/reset_password/presentation/controller/reset_password_binding.dart';
import 'package:live_tv/presentation/auth/reset_password/presentation/controller/reset_password_controller.dart';
import 'package:live_tv/utils/common/widgets/back_button/back_button.dart';
import 'package:live_tv/utils/common/widgets/button/custom_buttom.dart';
import 'package:live_tv/utils/common/widgets/space/space.dart';
import 'package:live_tv/utils/common/widgets/text_field/custom_text_field.dart';
import 'package:live_tv/utils/value/colors/colors.dart';
import 'package:live_tv/utils/value/style/text_style.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String code;
  final String email;
  const ResetPasswordScreen({super.key,required this.code,required this.email});

  @override
  Widget build(BuildContext context) {
    ResetPasswordBinding().dependencies();
    final resetController=Get.find<ResetPasswordController>();
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
                'Reset Password',
                style: pageHeaderTextStyle,
              ),
                const VerticalSpace(height: 8.0),
                const Text("Reset your account password",style: fontsize17WithGrayColorTextStyle,),
                const VerticalSpace(height: 22.0),
               CustomTextFieldWidget(
                controller: resetController.typePasswordcontroller,
                suffixIcon: const Icon(Icons.visibility_off),
                iconData: Icons.lock_outline, labelText: "Type Password"),
                const VerticalSpace(height: 20.0),
                
               CustomButton(txt: 'Continue',ontap: ()async{

          
               String res= await resetController.resetPassword(code, email, resetController.typePasswordcontroller.text.toString());
               if(res.toString().toLowerCase()=="Change Passowrd Successfully".toString().toLowerCase()){
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(res.toString()),
                ));
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
               }else{
                                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(res.toString()),
                ));
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
