


import 'package:get/get.dart';
import 'package:live_tv/utils/value/constrant/value.dart';

class ForgetRepo{

  static forgetPassword(String email)async{
    print(email.toString());
    try{
      final res=await dio.post("$BASE_URL/api/auth/forgot",data: {
        "email":email.toString().trim()
      });
      if(res.statusCode==200){
        return {
        "code":  res.data["code"],
        "email":res.data["email"]
        };
      }
    }catch (e){
      print(e);
    }
  }
}