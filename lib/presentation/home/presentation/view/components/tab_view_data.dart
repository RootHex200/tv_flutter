

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
          childAspectRatio: 5/6
      
          ), 
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              adscontroller.showRewardedAd();
              Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage(categoryId: categoryId,videoUrl: "",)));
            },
            child: Container(
             
              decoration: BoxDecoration(
                color:  Colors.black,
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
                        child: const Icon(Icons.info_rounded,color: AppColors.primaryAppBlueColor,size: 25,))),
                      const SizedBox(height: 6,),
                    Container(
                      height: 120,
                      decoration:  BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(image: NetworkImage("${BASE_URL}/${channelDataController.channeldata[index].image}"))
                      ),
                    ),
                    const VerticalSpace(height: 10),
                     Text(channelDataController.channeldata[index].name.toString(),maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color:AppColors.primaryAppBlueColor,fontWeight: FontWeight.bold,fontSize: 17))  , 
                    const VerticalSpace(height: 10,),
                   // const Text("Short Description of channel name",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color:AppColors.primaryAppRedColor,fontWeight: FontWeight.bold,fontSize: 14))  ,              
                    //channel name
                  
                  ],
                ),
              ),
            ),
          );
        }),
    );
  }
}