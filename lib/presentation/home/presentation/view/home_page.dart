import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/login/presentation/views/login_screen.dart';
import 'package:live_tv/presentation/home/presentation/controller/category_controller.dart';
import 'package:live_tv/presentation/home/presentation/controller/channel_data_controller.dart';
import 'package:live_tv/presentation/home/presentation/view/components/tab_view_data.dart';
import 'package:live_tv/presentation/profile/presentation/view/profile.dart';
import 'package:live_tv/utils/common/widgets/space/space.dart';
import 'package:live_tv/utils/value/colors/colors.dart';
import 'package:live_tv/utils/value/constrant/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late  CategoryController categoryController ;
  @override
  void initState() {
    categoryController = Get.put(CategoryController());
    super.initState();
  }
  @override
  void dispose() {
    Get.delete<CategoryController>();
    Get.delete<ChannelDataController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          title: Image.asset(
            
            "assets/images/app_logo.png",
            
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
                    color: AppColors.primaryAppBlacColor,
                  ),
                ))
          ],
        ),
        //         appBar: AppBar(

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
                      indicatorColor: AppColors.primaryAppBlacColor,
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
                                        ? AppColors.primaryAppBlacColor
                                        : AppColors.primaryAppBlacColor),
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
