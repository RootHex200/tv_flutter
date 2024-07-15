

import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:live_tv/presentation/profile/data/model/profile_model.dart';
import 'package:live_tv/presentation/profile/data/repositories/profile_repo.dart';

class ProfileController extends GetxController{
          final ImagePicker _picker = ImagePicker();
  var loading=false.obs;
  Rx<User> user=User().obs;
  
  var imageLoading=false.obs;
  Rx<ProfileModel> profile=ProfileModel().obs;

  userLogout()async{

    final res=await ProfileRepo.userLogout();
    return res;
  }

  Future getProfileInfo()async{
    print("here");
    loading.value=true;

    ProfileModel res=await ProfileRepo.getUserProfileInfo();
    profile.value=res;
    user.value=res.user!;
    loading.value=false;
    update();
  }
    var imagedata="".obs;
    Future<void> pickImage(String email,String name) async {
      try {
                            DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                    final id=androidInfo.id;
        imageLoading.value=true;
        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

        if (image != null) {
          File imageFile = File(image.path);
          List<int> imageBytes = await imageFile.readAsBytes();
          String base64Image = base64Encode(imageBytes);
          print(base64Image);
          imagedata.value=base64Image;

          imageLoading.value=false;
          await ProfileRepo.uploadImage(imageFile,email,id.toString(),name);
          
        } else {
          imageLoading.value=false;
        }
      } catch (e) {
        print(e);
        imageLoading.value=false;
      }
    }

  @override
  void onInit() {
    getProfileInfo();
    super.onInit();
  }
}