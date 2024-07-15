

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_tv/presentation/auth/login/presentation/views/login_screen.dart';
import 'package:live_tv/presentation/subscription/view/controller/subscription_controller.dart';
import 'package:live_tv/presentation/subscription/view/presentation/payment_option_screen.dart';
import 'package:live_tv/utils/common/widgets/space/space.dart';
import 'package:live_tv/utils/value/colors/colors.dart';
import 'package:live_tv/utils/value/constrant/value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});


  @override
  Widget build(BuildContext context) {
    SubscriptionController subscriptionController=Get.put(SubscriptionController());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar:  AppBar(
          title: const Text(
            "Subscription",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryWhiteColor),
          ),
          centerTitle: true,
          backgroundColor: AppColors.primaryAppBlacColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: AppColors.primaryWhiteColor,
              ),
            ),
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/images/app_logo.png"),
            ),
            const VerticalSpace(height: 20),
            const Text(
              'Get a premium channel access.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryWhiteColor
              ),
            ),
            const SizedBox(height: 10),
            const VerticalSpace(height: 20),
            Obx(
              ()=> subscriptionController.loading.value==true?const Center(child: CircularProgressIndicator(),): 
              Column(
                children:List.generate(subscriptionController.subscription.length, (index) {
                  subscriptionController.id.value=subscriptionController.subscription.first.id!;
                  return GestureDetector(
                  onTap: (){
                    subscriptionController.buttonSelect.value=index;
                    subscriptionController.id.value=subscriptionController.subscription[index].id!;
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                      decoration: BoxDecoration(
                        color:subscriptionController.buttonSelect.value==index?AppColors.primaryAppBlacColor: AppColors.whiteColor,
                        border: Border.all(
                          color: AppColors.primaryAppBlacColor,
                          width: 3
                        ),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                          Text("${subscriptionController.subscription[index].name!} package",style: TextStyle(color:subscriptionController.buttonSelect.value==index?AppColors.primaryWhiteColor:AppColors.primaryAppBlacColor,fontWeight: FontWeight.bold,fontSize: 19),),
                          const VerticalSpace(height: 5),
                          Text("Max Device ${subscriptionController.subscription[index].maxUser!}",style: TextStyle(color:subscriptionController.buttonSelect.value==index?AppColors.primaryWhiteColor:AppColors.primaryAppBlacColor,fontWeight: FontWeight.bold,fontSize: 19)),
                          const VerticalSpace(height: 5),
                           Text("${subscriptionController.subscription[index].duration.toString() }/${subscriptionController.subscription[index].type}-Price ${subscriptionController.subscription[index].amount}",style: TextStyle(color:subscriptionController.buttonSelect.value==index?AppColors.primaryWhiteColor: AppColors.primaryAppBlacColor,fontWeight: FontWeight.bold,fontSize: 19),),
                        ],
                      )
                    ),
                );
                }),
              ),
            ),
            const VerticalSpace(height: 20),
              
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async{
              final SharedPreferences prefss =await prefs;
                          if(prefss.getString("token")==null){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false);
                          }else{
                           
                           String link=await subscriptionController.paymentLink(subscriptionController.id.value.toString());
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen(link: link)));
                          }
     
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryAppBlacColor,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('CONTINUE',style: TextStyle(color: AppColors.primaryWhiteColor,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}