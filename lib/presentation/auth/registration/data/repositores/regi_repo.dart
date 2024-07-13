

import 'package:dio/dio.dart';
import 'package:live_tv/utils/value/constrant/value.dart';

class RegiRepo{

 static Future userRegi(String name,String email,String password)async{
    try{
    final response=await dio.post("$BASE_URL/api/auth/user/register",data: {
      "email":email.toString(),
      "password":password.toString(),
      "name":name.toString(),
    });

    if(response.statusCode==201){
      return response.data["token"];
    }else{
      return null;
    }
    }catch (e){
      print(e);
    }
  }
}