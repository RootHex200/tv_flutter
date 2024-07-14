import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:live_tv/presentation/home/presentation/view/home_page.dart';
import 'package:live_tv/presentation/profile/presentation/controller/profile_controller.dart';
import 'package:live_tv/presentation/profile/presentation/view/linked_device.dart';
import 'package:live_tv/presentation/profile/presentation/view/privay.dart';
import 'package:live_tv/presentation/subscription/view/presentation/subscription_page.dart';
import 'package:live_tv/utils/common/widgets/space/space.dart';
import 'package:live_tv/utils/value/colors/colors.dart';
import 'package:live_tv/utils/value/constrant/value.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController=Get.put(ProfileController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.whiteColor),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryAppRedColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
        body:  SingleChildScrollView(
          child: Obx(
            ()=>profileController.loading.value==true?const Center(child: CircularProgressIndicator(),): Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24, top: 15),
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [

                      profileController.user.value.image!=null?
                           CircleAvatar(
                                radius: 50,
                              backgroundImage: NetworkImage("$BASE_URL/${profileController.user.value.image!.toString()}"),
                              )
                        :profileController.imageLoading.value==true ||profileController.imagedata.value.isEmpty?  const CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.primaryAppRedColor,
                          ): CircleAvatar(
                            radius: 50,
                           backgroundImage: MemoryImage(base64Decode(profileController.imagedata.value.toString())),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: ()async {
                              await  profileController.pickImage(profileController.user.value.email!,profileController.user.value.name!);
                              },
                              child: const CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColors.balckColor,
                                child: Icon(
                                  Icons.edit,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalSpace(height: 20),
                    buildCustomContainer(
                      text: "Account Username",
                      trailing:  Text(
                        profileController.user.value.name.toString(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    const VerticalSpace(height: 8),
                    buildCustomContainer(
                      text: "Account Email",
                      trailing:  SizedBox(
                  
                        width: 150,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            profileController.user.value.email.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16.0,
                             
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    buildCustomContainer(
                      text: "Subscription",
                      trailing:  Text(
                       profileController.user.value.subscription==null?"Not Yet": "${profileController.user.value.subscription!.duration}/${profileController.user.value.subscription!.type}",
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: buildCustomContainer(
                        text: "Linked Device",
                        trailing:  Text(
                          profileController.profile.value.linkedDevice??"No subscription",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                                        const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: ()async {
                   final Uri _url =
                        Uri.parse('https://play.google.com/store/games');
                    if (!await launchUrl(_url)) {
                      throw Exception('Could not launch $_url');
                    }
                      },
                      child: buildCustomContainer(
                        text: "Rate",
                        trailing:  Icon(Icons.star,color: Colors.white,size: 25,),
                      ),
                    ),
                                        const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Share.share('check out my website https://example.com');
                      },
                      child: buildCustomContainer(
                        text: "Share",
                        trailing:  Icon(Icons.share,color: Colors.white,size: 25,)
                      ),
                    ),
                                                            const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PolicyPage()));
                      },
                      child: buildCustomContainer(
                        text: "Privacy & Policy",
                        trailing:  Icon(Icons.policy,color: Colors.white,size: 25,)
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () async{
                          final SharedPreferences prefss =await prefs;
                          prefss.clear();
                           final res=await profileController.userLogout();
                         showDialog(context: context, builder: (context){
                          return  AlertDialog(
                            title:Text(res.toString()),
                          );
                         });
                        Get.deleteAll();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const Homepage()));
                        },
                        child: buildCustomContainer(
                          text: "Log Out",
                          trailing: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SubscriptionScreen()));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: AppColors.balckColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Subscription",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                        ),
                      ),
                    ),
                    const VerticalSpace(height: 40),
                  ],
                ),
              ),
          ),
        ),
        ),
      );
    
  }

  //custom container
  Widget buildCustomContainer({
    required String text,
    required Widget trailing,
  }) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
          color: AppColors.primaryAppRedColor,
          borderRadius: BorderRadius.circular(9.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(0, 4),
                blurRadius: 2,
                spreadRadius: 3)
          ]),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16.0,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
