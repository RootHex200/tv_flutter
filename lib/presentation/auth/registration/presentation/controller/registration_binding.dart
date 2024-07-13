

import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/registration/presentation/controller/registration_controller.dart';

class registrationBinding extends Bindings{
  @override
  void dependencies() {
    
    Get.lazyPut(() => RegistrationController());
  }

}