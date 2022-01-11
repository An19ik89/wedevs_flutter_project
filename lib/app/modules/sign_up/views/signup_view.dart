import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/modules/sign_up/controllers/signup_controller.dart';
import 'package:wedevs_flutter_project/app/utils/res/colors.dart';
import 'package:wedevs_flutter_project/app/utils/res/dimens.dart';

class SignUpScreenView extends GetView<SignUpScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpScreenController>(
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
              Text("Sign Page",
                  style: TextStyle(
                      fontSize: Dimens.titleLarge,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ));
  }
}