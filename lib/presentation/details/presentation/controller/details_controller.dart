


import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/details/data/model/related_channel_model.dart';
import 'package:live_tv/presentation/details/data/repositories/details_repo.dart';
import 'package:live_tv/utils/common/widgets/space/space.dart';
import 'package:live_tv/utils/value/colors/colors.dart';

class DetailsController extends GetxController{
  DetailsController({required String url}){
    videoLink.value=url;
  }

  Rx<BetterPlayerController> betterPlayerController=BetterPlayerController(const BetterPlayerConfiguration()).obs;
  var loading=false.obs;
  RxList<Data> relatedData=<Data>[].obs;
  var videoLoading=false.obs;
  var videoLink="".obs;


  getReleatedChannel(String id)async{
    loading.value=true;
    RelatedChannelModel response=await DetaislRepo.getRelatedChannelData(id);
    relatedData.value=response.channels!.data!;
    loading.value=false;
  }

  loadVideo(String url){
    videoLoading.value=true;
    videoLink.value=url;
    videoLoading.value=false;
  }

  changeVideo(String url){
    videoLoading.value=true;
    videoLink.value=url;
    videoLoading.value=false;
  }

  @override
  void onInit() {
    print("OnInit....................................");
 betterPlayerController.value= BetterPlayerController(
  
     BetterPlayerConfiguration(
      autoDispose: true,
      autoPlay: true,
                    errorBuilder: (context, errorMessage) {
                                      return Center(child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.error,color: AppColors.primaryWhiteColor,size: 25,),
                                          VerticalSpace(height: 10),
                                          Text("Channel Can't be played",style: TextStyle(color:AppColors.primaryWhiteColor,fontSize: 20),),
                                        ],
                                      ));
                                    },
    ),
        betterPlayerDataSource: BetterPlayerDataSource(
    BetterPlayerDataSourceType.network,
    videoLink.value,
    liveStream: false,
    useAsmsSubtitles: true,
    
    // hlsTrackNames: ["Low quality", "Not so low quality", "Medium quality"],
    subtitles: [
        BetterPlayerSubtitlesSource(
          type: BetterPlayerSubtitlesSourceType.network,
          name: "EN",
          urls: [
            "https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt"
          ],
        ),

        BetterPlayerSubtitlesSource(
          type: BetterPlayerSubtitlesSourceType.network,
          name: "DE",
          urls: [
            "https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt"
          ],
        ),
    ],
));
    super.onInit();
  }
}