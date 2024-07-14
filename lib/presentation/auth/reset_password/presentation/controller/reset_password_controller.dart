

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/reset_password/data/repositories/reset_repo.dart';

class ResetPasswordController extends GetxController{
  late TextEditingController typePasswordcontroller;
  late TextEditingController retypePasswordcontroller;

  @override
  void onInit() {
    typePasswordcontroller=TextEditingController();
    retypePasswordcontroller=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    typePasswordcontroller.dispose();
    retypePasswordcontroller.dispose();
    super.dispose();
  }

  resetPassword(String code,String email,String password)async{
    return await ResetRepo.resetPassword(code, email, password);
  }
}