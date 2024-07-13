

import 'package:dio/dio.dart';
import 'package:live_tv/presentation/subscription/data/model/subscription_model.dart';
import 'package:live_tv/utils/value/constrant/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionRepo{


  static getAllSubscription()async{
    try{
      final response=await dio.get("$BASE_URL/api/subscription/list");
      if(response.statusCode==200){
        return SubscriptionModel.fromJson(response.data);
      }
    }catch (e){
      return SubscriptionModel();
    }
  }

  static Future getPaymentLink(String id)async{
    final SharedPreferences prefss =await prefs;
    final token=prefss.getString("token");
    print(token);
    print(id);
    try{
      final response=await dio.post("$BASE_URL/api/user/paypal/process-payment",data: {
        "subscription":id.toString()
      },options: Options(
        headers: {
          "Authorization":"Bearer $token"
        }
      ));
      if(response.statusCode==200){
        print(response.data);
        return response.data["approval_url"];
      }
    }catch (e){
      return "";
    }
  }
}