


import 'package:dio/dio.dart';
import 'package:live_tv/utils/value/constrant/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetRepo{


  static resetPassword(String code,String  email,String password)async{
    try{
    final SharedPreferences prefss =await prefs;
    final token=prefss.getString("token");  
    final response=await dio.post("$BASE_URL/api/auth/forgotpass",data: {
      "code":code,
      "email":email.trim(),
      "new_password":password
    },options: Options(
      headers: {
        "Authorization":"Bearer $token"
      }
    ));
    if(response.statusCode==200){
      return "Change Passowrd Successfully";
    }
    }catch (e){
      return "Faild to Change Password";
    }
  }
}