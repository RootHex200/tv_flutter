

import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/reset_password/presentation/controller/reset_password_controller.dart';

class ResetPasswordBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }

}