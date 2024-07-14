

import 'package:dio/dio.dart';
import 'package:live_tv/presentation/details/data/model/related_channel_model.dart';
import 'package:live_tv/presentation/home/data/model/channel_model.dart';
import 'package:live_tv/utils/value/constrant/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetaislRepo{

    static Future<RelatedChannelModel> getRelatedChannelData(String id)async{
    final SharedPreferences prefss =await prefs;
    final token=prefss.getString("token");
    try{
      final response=await dio.get("$BASE_URL/api/channels",queryParameters: {"category_id":id},options: Options(
        headers: {
          "Authorization":"Bearer $token"
        }
      ));
      if(response.statusCode==200){
        return RelatedChannelModel.fromJson(response.data);
      }else{
        return RelatedChannelModel();
      }
    }catch (e){
      return RelatedChannelModel();
    }
  }
}