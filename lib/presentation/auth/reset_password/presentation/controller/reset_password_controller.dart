

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}