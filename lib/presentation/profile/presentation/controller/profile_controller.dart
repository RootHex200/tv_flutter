

import 'package:get/get.dart';
import 'package:live_tv/presentation/profile/data/model/profile_model.dart';
import 'package:live_tv/presentation/profile/data/repositories/profile_repo.dart';

class ProfileController extends GetxController{
  var loading=false.obs;
  Rx<User> user=User().obs;
  

  userLogout()async{

    final res=await ProfileRepo.userLogout();
    return res;
  }

  getProfileInfo()async{
    print("here");
    loading.value=true;

    ProfileModel res=await ProfileRepo.getUserProfileInfo();
    user.value=res.user!;
    loading.value=false;
    update();
  }

  @override
  void onInit() {
    getProfileInfo();
    super.onInit();
  }
}