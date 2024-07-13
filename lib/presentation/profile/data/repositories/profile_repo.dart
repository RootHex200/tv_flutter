


import 'package:dio/dio.dart';
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


 static getUserProfileInfo()async{
        try{
    final SharedPreferences prefss =await prefs;
    final token=prefss.getString("token");      
      final response=await dio.get("$BASE_URL/api/user/profile",options: Options(
        headers: {
          "Authorization":"Bearer $token"
        }
      ));
    if(response.statusCode==200){
      return ProfileModel.fromJson(response.data);
    }
    }catch (e){
      return ProfileModel();
    }
  }
}