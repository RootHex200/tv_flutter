

import 'package:get/get.dart';
import 'package:live_tv/presentation/subscription/data/model/subscription_model.dart';
import 'package:live_tv/presentation/subscription/data/repositories/subscription_repo.dart';

class SubscriptionController extends GetxController{
  RxList<Subscriptions> subscription=<Subscriptions>[].obs;
  var loading=false.obs;
  var id=0.obs;
  var buttonSelect=0.obs;
    @override
  void onInit() async{
    await getSubscriptionList();
    super.onInit();
  }
  getSubscriptionList()async{
    loading.value=true;
    SubscriptionModel response=await SubscriptionRepo.getAllSubscription();
    subscription.value=response.subscriptions!;
    loading.value=false;
  }

  paymentLink(String id)async{
    return await SubscriptionRepo.getPaymentLink(id);
  }
}