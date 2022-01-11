import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/modules/menu/controllers/menu_screen_controller.dart';
import 'package:wedevs_flutter_project/app/utils/res/colors.dart';
import 'package:wedevs_flutter_project/app/utils/res/dimens.dart';

class MenuScreenView extends GetView<MenuScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuScreenController>(
        builder: (controller) => Scaffold(
          backgroundColor: CustomColors.KAshBg1,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: CustomColors.KRoseGoldColor,statusBarIconBrightness: Brightness.dark),
              backgroundColor: CustomColors.KPrimaryStatusBarColor,
              elevation: 0,
            ),
          ),
          body: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Menu Page",
                  style: TextStyle(
                      fontSize: Dimens.titleLarge,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ));
  }
}