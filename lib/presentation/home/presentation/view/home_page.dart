import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/login/presentation/views/login_screen.dart';
import 'package:live_tv/presentation/home/presentation/controller/category_controller.dart';
import 'package:live_tv/presentation/home/presentation/view/components/tab_view_data.dart';
import 'package:live_tv/presentation/profile/presentation/view/profile.dart';
import 'package:live_tv/utils/common/widgets/space/space.dart';
import 'package:live_tv/utils/value/colors/colors.dart';
import 'package:live_tv/utils/value/constrant/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          title: Image.asset(
            
            "assets/images/logo.png",
            height: 70,
            width: 200,),
          centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () async {
                  final SharedPreferences prefss = await prefs;
                  if (prefss.getString("token") == null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()));
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: const Icon(
                    Icons.person,
                    color: AppColors.primaryAppRedColor,
                  ),
                ))
          ],
        ),
        //         appBar: AppBar(
        // leading: SizedBox(
      
        //   child: Image.asset("assets/images/app_logo.png"),
        // ),
        //           actions: [
        // GestureDetector(
        //       onTap: ()async{
        //         final SharedPreferences prefss =await prefs;
        //         if(prefss.getString("token")==null){
        //           Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
        //         }else{
        //           Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfilePage()));
        //         }
        //       },
        //       child: const Icon(Icons.person,color: AppColors.primaryAppBlueColor,))
        //           ],
        //           title: const Text("BioscopeBox",style: TextStyle(color: AppColors.primaryAppBlueColor,fontWeight: FontWeight.bold,fontSize: 20),),
        //   backgroundColor: AppColors.balckColor,
        //   bottom:  TabBar(
      
        //     onTap: (value){
        //       categoryController.mainTabbarselected.value=value;
        //     },
      
        //     padding: const EdgeInsets.only(bottom: 0,top: 0),
        //     dividerColor: Colors.grey,
        //     indicatorColor: AppColors.primaryAppBlueColor,
        //     tabs: [
        //       Obx(
        //         ()=> Tab(
      
        //          child: Text("Live Tv",style: TextStyle(color: categoryController.mainTabbarselected.value==0?AppColors.textbluecolor:AppColors.primaryWhiteColor),),
      
        //         ),
        //       ),
        //       Obx(
        //         ()=> Tab(
      
        //          child: Text("Catch Up",style: TextStyle(color: categoryController.mainTabbarselected.value==1?AppColors.textbluecolor:AppColors.primaryWhiteColor),),
      
        //         ),
        //       ),
        //       Obx(
        //         ()=> Tab(
      
        //          child: Text("Tv Guide",style: TextStyle(color: categoryController.mainTabbarselected.value==2?AppColors.textbluecolor:AppColors.primaryWhiteColor),),
      
        //         ),
        //       ),
        //       Obx(
        //         ()=> Tab(
      
        //          child: Text("My List",style: TextStyle(color: categoryController.mainTabbarselected.value==3?AppColors.textbluecolor:AppColors.primaryWhiteColor),),
      
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        body: Column(
          children: [
            const VerticalSpace(height: 20),
            Obx(
              () => categoryController.loading.value == true
                  ? const Text("")
                  : TabBar(
                      isScrollable: true,
                      padding: const EdgeInsets.only(bottom: 0, top: 0),
                      onTap: (value) {
                        categoryController.selectTabTextColor.value = value;
                      },
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      controller: categoryController.tabController,
                      indicatorColor: AppColors.primaryAppRedColor,
                      tabs: List.generate(
                          categoryController.tabData.length,
                          (index) => Tab(
                                  child: Text(
                                categoryController.tabData[index].name
                                    .toString(),
                                style: TextStyle(
                                    color: categoryController
                                                .selectTabTextColor.value ==
                                            index
                                        ? AppColors.primaryAppRedColor
                                        : AppColors.balckColor),
                              )))),
            ),
            const VerticalSpace(height: 20),
            Expanded(
                child: Obx(
              () => categoryController.loading.value == true
                  ? const Center(child: CircularProgressIndicator())
                  : TabBarView(
                      controller: categoryController.tabController,
                      children: List.generate(
                          categoryController.tabController.length,
                          (index) => TabViewData(
                                categoryId: categoryController
                                    .tabData[index].id
                                    .toString(),
                              ))),
            ))
          ],
        ),
      ),
    );
  }
}
