

import 'package:dio/dio.dart';
import 'package:live_tv/presentation/home/data/model/category_model.dart';
import 'package:live_tv/presentation/home/data/model/channel_model.dart';
import 'package:live_tv/utils/value/constrant/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRep{


  static Future<CategoryModel> getCategoryList()async{
    // final SharedPreferences _prefs = await prefs;
    // final token=_prefs.getString("token");
    try{
      final response=await dio.get("$BASE_URL/api/categories");
      if(response.statusCode==200){
        return CategoryModel.fromJson(response.data);
      }else{
        return CategoryModel();
      }
    }catch (e){
      return CategoryModel();
    }
  }

  static Future<ChannelModel> getChannelData(String id)async{
    final SharedPreferences prefss =await prefs;
    final token=prefss.getString("token");
    print("channel Token: $token");
    try{
      final response=await dio.get("$BASE_URL/api/channels",queryParameters: {"category_id":id},options: Options(
        headers: {
          "Authorization":"Bearer $token"
        }
      ));
      if(response.statusCode==200){
        return ChannelModel.fromJson(response.data);
      }else{
        return ChannelModel();
      }
    }catch (e){
      return ChannelModel();
    }
  }
}