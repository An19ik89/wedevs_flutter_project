import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/modules/cart/views/cart_views.dart';
import 'package:wedevs_flutter_project/app/modules/home/views/home_views.dart';
import 'package:wedevs_flutter_project/app/modules/menu/views/menu_view.dart';
import 'package:wedevs_flutter_project/app/modules/profile/views/profile_view.dart';
import 'package:wedevs_flutter_project/app/modules/search/views/search_view.dart';


class HomeController extends GetxController {
  int selectedIndex = 0;

  List<Widget> screenList = [
    HomeView(),
    MenuScreenView(),
    SearchScreenView(),
    CartScreenView(),
    ProfileScreenView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    //print("Arg : ${Get.arguments}");
    if(Get.arguments != null){
      int? prefferedIndex = Get.arguments["index"];
      onTabChange(prefferedIndex ?? 0);
    }


  }

  @override
  void onClose() {}

  onTabChange(int index) {
    selectedIndex = index;
    update();
  }
}
