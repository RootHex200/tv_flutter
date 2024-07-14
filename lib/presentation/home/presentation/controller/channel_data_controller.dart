

import 'package:get/get.dart';
import 'package:live_tv/presentation/home/data/model/channel_model.dart';
import 'package:live_tv/presentation/home/data/repositories/home_repo.dart';

class ChannelDataController extends GetxController{

  var loadingdata=false.obs;
  RxList<Data> channeldata=<Data>[].obs;


   getChannelData(String id)async{
    print("code");
    loadingdata.value=true;
    ChannelModel response=await HomeRep.getChannelData(id);
    channeldata.value=response.channels!.data!;
    loadingdata.value=false;
 
  }
}