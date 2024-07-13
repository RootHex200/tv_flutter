

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:live_tv/utils/common/widgets/space/space.dart';
import 'package:live_tv/utils/value/colors/colors.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Tv Player",style: TextStyle(color: AppColors.primaryAppBlueColor,fontWeight: FontWeight.bold,fontSize: 22),),
          leading:const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryAppBlueColor,
            ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
                      aspectRatio: 16 / 9,
                      child: BetterPlayer.network(
                        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                        betterPlayerConfiguration: const BetterPlayerConfiguration(
                          autoPlay: true,
            aspectRatio: 16 / 9,
                        ),
                      ),
                    ),
            const VerticalSpace(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text("Suggation Channel",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color:AppColors.primaryAppBlueColor,fontWeight: FontWeight.bold,fontSize: 22)))                ,
            const VerticalSpace(height: 30),
            Expanded(
              child: GridView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      primary: false,
                      
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5
                    
                        ), 
                      itemBuilder: (context,index){
                        return Container(
                         
              decoration: const BoxDecoration(
                color: Colors.red,
                image: DecorationImage(image: AssetImage("assets/images/download.png"))
              ),
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }
}