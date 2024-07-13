

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/registration/data/repositores/regi_repo.dart';
import 'package:live_tv/utils/value/constrant/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationController extends GetxController{

  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController userNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    fullNameController=TextEditingController();
    emailController=TextEditingController();
    userNameController=TextEditingController();
    phoneNumberController=TextEditingController();
    passwordController=TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    userNameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }

    userRegiController(String name,String email,String password)async{
      
    final SharedPreferences _prefs = await prefs;
    final response=await RegiRepo.userRegi(name, email, password);
    if(response!=null){
     var res= _prefs.setString("token", response).then((bool success) => true);
     return res;
    }
  }
}