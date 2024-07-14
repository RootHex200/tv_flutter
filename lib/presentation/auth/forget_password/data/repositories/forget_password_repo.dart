


import 'package:dio/dio.dart';
import 'package:live_tv/utils/value/constrant/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetRepo{

  static forgetPassword(String email)async{
    try{
          final SharedPreferences prefss =await prefs;
    final token=prefss.getString("token");  
      final res=await dio.get("$BASE_URL/api/auth/forgot",data: {
        "email":email.toString()
      },options: Options(
        headers: {
          "Authorization":"Bearer $token"
        }
      ));
      if(res.statusCode==200){
        return {
        "code":  res.data["code"],
        "email":res.data["email"]
        };
      }
    }catch (e){
      
    }
  }
}