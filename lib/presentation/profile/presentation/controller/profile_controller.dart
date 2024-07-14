

import 'package:get/get.dart';
import 'package:live_tv/presentation/profile/data/model/profile_model.dart';
import 'package:live_tv/presentation/profile/data/repositories/profile_repo.dart';

class ProfileController extends GetxController{
  var loading=false;
  User user=User();
  userLogout()async{

    final res=await ProfileRepo.userLogout();
    return res;
  }

  getProfileInfo()async{
    loading=true;

    ProfileModel res=await ProfileRepo.getUserProfileInfo();
    user=res.user!;
    loading=false;
    update();
  }
}