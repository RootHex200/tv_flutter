


import 'package:better_player/better_player.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/details/data/model/related_channel_model.dart';
import 'package:live_tv/presentation/details/data/repositories/details_repo.dart';

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
  
    const BetterPlayerConfiguration(
      autoDispose: true,
      autoPlay: true
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