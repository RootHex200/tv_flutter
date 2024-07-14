

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/forget_password/data/repositories/forget_password_repo.dart';

class ForgetPasswordController extends GetxController{

  late TextEditingController emailController;

  @override
  void onInit() {
    emailController=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }


  getCode(String email)async{
   return await ForgetRepo.forgetPassword(email);
  }

}