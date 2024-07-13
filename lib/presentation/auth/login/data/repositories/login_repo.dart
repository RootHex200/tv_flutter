

import 'package:live_tv/utils/value/constrant/value.dart';

class LoginRepo{

  static Future userLogin(String devicename,String email,String password,String deviceid)async{
    try{
    final response=await dio.post("$BASE_URL/api/auth/user/login",data: {
      "email":email.toString(),
      "password":password.toString(),
      "device":devicename.toString(),
      "ip_address":deviceid.toString(),
    });
    print(response);
    if(response.statusCode==200){
      return response.data["token"];
    }else{
      return null;
    }
    }catch (e){
      print(e);
    }
  }
}