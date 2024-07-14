

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/details/presentation/view/details_page.dart';
import 'package:live_tv/presentation/home/presentation/controller/channel_data_controller.dart';
import 'package:live_tv/utils/ads/add_controller.dart';
import 'package:live_tv/utils/common/widgets/space/space.dart';
import 'package:live_tv/utils/value/colors/colors.dart';
import 'package:live_tv/utils/value/constrant/value.dart';

class TabViewData extends StatelessWidget {
  final String categoryId;
  const TabViewData({super.key,required this.categoryId});

  @override
  Widget build(BuildContext context) {
    ChannelDataController channelDataController=Get.put(ChannelDataController());
    final adscontroller=Get.put(AdsController());
    Future.delayed(const Duration(milliseconds: 10),(){
      channelDataController.getChannelData(categoryId);
    });
    return Obx(
      ()=> channelDataController.loadingdata.value==true?const Center(child: CircularProgressIndicator()): GridView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: channelDataController.channeldata.length,
        shrinkWrap: true,
        primary: false,
        
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 4/5.2
      
          ), 
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              int randomIndex = Random().nextInt(channelDataController.channeldata.length) + 0; // Generate random index from 1 to 5
                               if (randomIndex == index) {
                                   adscontroller.showRewardedAd();
                               }
            
              Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage(categoryId: categoryId,videoUrl:channelDataController.channeldata[index].hdUrl!.isEmpty? channelDataController.channeldata[index].url!:channelDataController.channeldata[index].hdUrl!,)));
            },
            child: Opacity(
              // opacity:channelDataController.channeldata[index].hdUrl!.isNotEmpty? 0.5:1,
              opacity: 1,
              child: Container(
               
                decoration: BoxDecoration(
                  color:  AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 2,
                     // changes position of shadow
                  ),
                  
                  ]
                   
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                       Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: (){
                           showDialog(context: context, builder: (context)=>  AlertDialog(
                              title: Text(channelDataController.channeldata[index].name.toString()),
                              content: Text(channelDataController.channeldata[index].description.toString()),
                            ));
                          },
                          child: const Icon(Icons.info_rounded,color: AppColors.primaryAppRedColor,size: 25,))),
                        const SizedBox(height: 6,),
                    // channelDataController.channeldata[index].hdUrl!.isNotEmpty?
                    //  Center(
                    //    child: Container(
                    //       height: 120,
                    //       child: Icon(Icons.lock,size: 100,color: AppColors.primaryWhiteColor,),
                    //     ),
                    //  ):  
                     Container(
                        height: 120,
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(image: NetworkImage("${BASE_URL}/${channelDataController.channeldata[index].image}"))
                        ),
                      ),
                      const VerticalSpace(height: 10),
                       Center(
                         child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 7,vertical: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primaryAppRedColor,
                          ),
                          child: Text(channelDataController.channeldata[index].name.toString(),maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color:AppColors.whiteColor,fontWeight: FontWeight.bold,fontSize: 17))),
                       )  ,
                      const VerticalSpace(height: 4),
                      Container(
                        height: 30,
                        width:25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryAppRedColor
                        ),
                        child: Center(child: Text((index+1).toString(),style: TextStyle(color: AppColors.whiteColor,fontWeight: FontWeight.bold,fontSize: 19),))), 
                  
                     // const Text("Short Description of channel name",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color:AppColors.primaryAppRedColor,fontWeight: FontWeight.bold,fontSize: 14))  ,              
                      //channel name
                    
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
    );
  }
}