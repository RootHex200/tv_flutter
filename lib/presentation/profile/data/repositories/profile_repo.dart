


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:live_tv/presentation/auth/login/presentation/controller/login_controller.dart';
import 'package:live_tv/presentation/profile/data/model/profile_model.dart';
import 'package:live_tv/utils/value/constrant/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepo{


  static userLogout()async{

    try{
    final SharedPreferences prefss =await prefs;
    final token=prefss.getString("token");      
   
      final response=await dio.get("$BASE_URL/api/user/logout",options: Options(
        headers: {
          "Authorization":"Bearer $token"
        }
      ));
    if(response.statusCode==200){
      
      return "Logout Successfully";
    }
    }catch (e){
      print(e);
      return "Failed Logout";
    }
  }


   static String getFileName(String filePath) {
    return filePath.split('/').last;
  }
  static Future<void> uploadImage(File imageFile,String email,String ip,String name) async {
    String fileName = getFileName(imageFile.path);
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(imageFile.path, filename: fileName),
      "email":email.trim(),
      "name":name.toString().trim(),
      "ip_address":ip.toString().trim()
    });

    try {
      final SharedPreferences prefss =await prefs;
    final token=prefss.getString("token");      
      Response response = await dio.post("$BASE_URL/api/user/update",options: Options(
        headers: {
          "Authorization":"Bearer $token"
        }
      ), data: formData);
      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Image upload failed');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


 static getUserProfileInfo()async{
  print("getuserprofie");
        try{
    final SharedPreferences prefss =await prefs;
    final token=prefss.getString("token");  
    print("profile info:$token");    

      final response=await dio.get("$BASE_URL/api/user/profile",options: Options(
        headers: {
          "Authorization":"Bearer $token"
        }
      ));
    print(response.data);
    if(response.statusCode==200){
      return ProfileModel.fromJson(response.data);
    }
    }catch (e){
      print(e);
      return ProfileModel();
    }
  }
}