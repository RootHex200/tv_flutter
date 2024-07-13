

import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/login/presentation/controller/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}