


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/login/data/repositories/login_repo.dart';
import 'package:live_tv/utils/value/constrant/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  LoginController();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void onInit() {
    emailController=TextEditingController();
    passwordController=TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }



  userLoginController(String devicename,String email,String deviceid,String password)async{
    final SharedPreferences _prefs = await prefs;
    final response=await LoginRepo.userLogin(devicename, email, password, deviceid);
    print("from login controller $response");
    if(response!=null){
      print("code is here");
      var res=_prefs.setString("token", response).then((bool success) => true);
      return res;
    }
  }

}