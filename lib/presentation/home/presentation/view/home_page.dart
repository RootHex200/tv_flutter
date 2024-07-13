
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
    final categoryController=Get.put(CategoryController());
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.black,
          
                appBar: AppBar(
                  actions: [
                  GestureDetector(
                        onTap: ()async{
                          final SharedPreferences prefss =await prefs;
                          if(prefss.getString("token")!.isEmpty ||prefss.getString("token")==null){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false);
                          }else{
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ProfilePage()), (route) => false);
                          }
                        },
                        child: const Icon(Icons.person,color: AppColors.primaryAppBlueColor,))
                  ],
                  title: const Text("BioscopeBox",style: TextStyle(color: AppColors.primaryAppBlueColor,fontWeight: FontWeight.bold,fontSize: 20),),
          backgroundColor: Colors.black,
          bottom:  TabBar(
            
            onTap: (value){
              categoryController.mainTabbarselected.value=value;
            },
            
            padding: const EdgeInsets.only(bottom: 0,top: 0),
            dividerColor: Colors.grey,
            indicatorColor: AppColors.primaryAppBlueColor,
            tabs: [
              Obx(
                ()=> Tab(
                  
                 child: Text("Live Tv",style: TextStyle(color: categoryController.mainTabbarselected.value==0?AppColors.textbluecolor:AppColors.primaryWhiteColor),),
                  
                
                ),
              ),
              Obx(
                ()=> Tab(
                  
                 child: Text("Catch Up",style: TextStyle(color: categoryController.mainTabbarselected.value==1?AppColors.textbluecolor:AppColors.primaryWhiteColor),),
                  
                
                ),
              ),
              Obx(
                ()=> Tab(
                  
                 child: Text("Tv Guide",style: TextStyle(color: categoryController.mainTabbarselected.value==2?AppColors.textbluecolor:AppColors.primaryWhiteColor),),
                  
                
                ),
              ),
              Obx(
                ()=> Tab(
                  
                 child: Text("My List",style: TextStyle(color: categoryController.mainTabbarselected.value==3?AppColors.textbluecolor:AppColors.primaryWhiteColor),),
                  
                
                ),
              ),
            ],
          ),
        ),
          body: TabBarView(
            children:[
              Column(
                            children: [
              const VerticalSpace(height: 20),
                            
                  
                  
              Obx(
                ()=>categoryController.loading.value==true? const Text(""): TabBar(
                    padding: const EdgeInsets.only(bottom: 0,top: 0),
                  onTap: (value){
                    categoryController.selectTabTextColor.value=value;
                  },
                      dividerColor: Colors.transparent,
                      controller: categoryController.tabController,
                      indicatorColor: Colors.blue,
                
                        tabs: List.generate(categoryController.tabData.length, (index) =>    Tab(
                          
                          child: Padding(         
                            padding:const EdgeInsets.only(left:20,right: 20,bottom: 10,top: 10),
                            child: Text(categoryController.tabData[index].name.toString(),style: TextStyle(color: categoryController.selectTabTextColor.value==index?AppColors.textbluecolor:AppColors.primaryWhiteColor),))
                            
                            )
                            
                            )
                        ),
              ),
              const VerticalSpace(height: 20),
               Expanded(child: 
               
                Obx(
                  ()=>categoryController.loading.value==true? const Center(child: CircularProgressIndicator()) :TabBarView(
                                
                  controller: categoryController.tabController,
                  children: List.generate(categoryController.tabController.length, (index) =>  TabViewData(categoryId: categoryController.tabData[index].id.toString(),))),
                ))
                            ],
                          ),
            
              Container(),
              Container(),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}