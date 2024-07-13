
import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/forget_password/presentation/controller/forget_password_controller.dart';

class ForgetBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}