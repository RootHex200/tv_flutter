


import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:live_tv/presentation/home/data/model/category_model.dart';
import 'package:live_tv/presentation/home/data/repositories/home_repo.dart';
import 'package:live_tv/presentation/home/presentation/view/home_page.dart';
import 'package:live_tv/utils/ads/ads_helper.dart';

class CategoryController extends GetxController with GetTickerProviderStateMixin{

  late TabController tabController;
  RxList<Categories> tabData=<Categories>[].obs;
  var loading=false.obs;
  var selectTabTextColor=0.obs;

  var mainTabbarselected=0.obs;

  @override
  void onInit() async{
    var data=await getTabData();
    tabController=TabController(length:data, vsync: this);
    super.onInit();
  }


    Future<int> getTabData()async{
    loading.value=true;
    final CategoryModel response=await HomeRep.getCategoryList();
    for(int i=0;i<response.categories!.length;i++){
      tabData.add(response.categories![i]);
    }
    loading.value=false;
    return tabData.length;
  }

  



}