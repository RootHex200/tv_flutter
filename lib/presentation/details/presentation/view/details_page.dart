import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:live_tv/presentation/details/presentation/controller/details_controller.dart';
import 'package:live_tv/utils/ads/add_controller.dart';
import 'package:live_tv/utils/common/widgets/space/space.dart';
import 'package:live_tv/utils/value/colors/colors.dart';
import 'package:live_tv/utils/value/constrant/value.dart';

class DetailsPage extends StatefulWidget {
  final String categoryId;
  final String videoUrl;
  const DetailsPage(
      {super.key, required this.categoryId, required this.videoUrl});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late DetailsController detailsController;
  late AdsController adsController;
  @override
  void initState() {
    print(widget.videoUrl);
    adsController=Get.put(AdsController());
     detailsController = Get.put(DetailsController(
        url:widget.videoUrl));
    detailsController.getReleatedChannel(widget.categoryId);
    super.initState();
  }
  @override
  void dispose() {
    detailsController.betterPlayerController.value.dispose();
    Get.delete<DetailsController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
            //           leading: SizedBox(
            //   child: Image.asset("assets/images/app_logo.png"),
            // ),
          backgroundColor: AppColors.whiteColor,
          centerTitle: true,
          title: Image(
            height: 100,
            width: 200,
            image: AssetImage("assets/images/logo.png")),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryAppRedColor,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () {
                return detailsController.videoLoading.value == true ||
                        detailsController.videoLink.value.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : AspectRatio(
                        aspectRatio: 16 / 9,
                        child: BetterPlayer(
                            controller:
                                detailsController.betterPlayerController.value),
                      );
              },
            ),
            SizedBox(height: 10,),
            Center(
              child: Container(
                height: 40,
                width: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                   color: AppColors.primaryAppRedColor,
                ),
                child: Center(
                  child: Text("Watch Live Channel Now",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22)),
                ),
              ),
            ),
            const VerticalSpace(height: 30),
            if(adsController.isBannerAdReady.value)
               Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: adsController.bannerAd.size.width.toDouble(),
                      height:  adsController.bannerAd.size.height.toDouble(),
                      child: AdWidget(ad: adsController.bannerAd),
                    ),
                  ),
                ),
            const VerticalSpace(height: 50),
            Obx(
              () => Expanded(
                child: detailsController.loading.value == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: GridView.builder(
                          itemCount: detailsController.relatedData.length,
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                          detailsController.betterPlayerController.value.dispose();
                          detailsController.betterPlayerController.value =
                              BetterPlayerController(
                                  const BetterPlayerConfiguration(
                                    autoDispose: true,
                                    autoPlay: true
                                  ),
                                  betterPlayerDataSource:
                                      BetterPlayerDataSource(
                                    BetterPlayerDataSourceType.network,
                                    detailsController.relatedData[index].url!,
                                    liveStream: false,
                                    useAsmsSubtitles: true,
                                    // hlsTrackNames: ["Low quality", "Not so low quality", "Medium quality"],
                                    subtitles: [
                                      BetterPlayerSubtitlesSource(
                                        type: BetterPlayerSubtitlesSourceType
                                            .network,
                                        name: "EN",
                                        urls: [
                                          "https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt"
                                        ],
                                      ),
                                      BetterPlayerSubtitlesSource(
                                        type: BetterPlayerSubtitlesSourceType
                                            .network,
                                        name: "DE",
                                        urls: [
                                          "https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt"
                                        ],
                                      ),
                                    ],
                                  ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "$BASE_URL/${detailsController.relatedData[index].image}"))),
                              ),
                            );
                          }),
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
