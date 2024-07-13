

import 'package:get/get.dart';
import 'package:live_tv/presentation/home/data/model/channel_model.dart';
import 'package:live_tv/presentation/home/data/repositories/home_repo.dart';

class ChannelDataController extends GetxController{
  var id="0".obs;
  ChannelDataController({required String categoryid}){
    id.value=categoryid;
  }
  var loadingdata=false.obs;
  RxList<Data> channeldata=<Data>[].obs;
  @override
  void onInit()async {
  await  getChannelData(id.value);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


   getChannelData(String id)async{
    loadingdata.value=true;
    ChannelModel response=await HomeRep.getChannelData(id);
    channeldata.value=response.channels!.data!;
    loadingdata.value=false;
 
  }
}