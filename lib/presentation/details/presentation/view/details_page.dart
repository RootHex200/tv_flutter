import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/details/presentation/controller/details_controller.dart';
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
  @override
  void initState() {
    print("initState................................");
     detailsController = Get.put(DetailsController(
        url: "https://live-hls-audio-aja-fa.getaj.net/VOICE-AJA/index.m3u8"));
    detailsController.getReleatedChannel(widget.categoryId);
    super.initState();
  }
  @override
  void dispose() {
    print("hellow");
    detailsController.betterPlayerController.value.dispose();
    Get.delete<DetailsController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "BioScope Box",
            style: TextStyle(
                color: AppColors.primaryAppBlueColor,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryAppBlueColor,
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
            const VerticalSpace(height: 30),
            const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Related Channel",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppColors.primaryAppBlueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22))),
            const VerticalSpace(height: 30),
            Obx(
              () => Expanded(
                child: detailsController.loading.value == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GestureDetector(
                        onTap: () {
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
                                    "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
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
                        child: Padding(
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
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "$BASE_URL/${detailsController.relatedData[index].image}"))),
                                );
                              }),
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
