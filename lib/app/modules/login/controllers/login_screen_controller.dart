import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wedevs_flutter_project/app/api/repository/login_repository.dart';
import 'package:wedevs_flutter_project/app/data/local/local_storage.dart';
import 'package:wedevs_flutter_project/app/data/model/user_model.dart';
import 'package:wedevs_flutter_project/app/routes/app_pages.dart';

class LoginScreenController extends GetxController {


  final LoginRepository loginRepository = Get.find();
  UserModel? userLoggedInInfo = UserModel(token: '', userEmail: '', userDisplayName: '', userNicename: '');
  final userInfo = GetStorage();
  var loginProcess = false.obs;
  RxBool obscureText = true.obs;
  RxBool autoValidate = true.obs;
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}


  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
  }

  passWordVisibility(){
    obscureText.value = !obscureText.value;
  }

  void login() async
  {
    loginProcess(true);
    try {
      userLoggedInInfo = await loginRepository.signInWithUserNamePassword(email: emailTextController.text, password: passwordTextController.text);
      if (userLoggedInInfo != null)
      {
        if (userLoggedInInfo?.token != '')
        {
          LocalStorage().setToken(userLoggedInInfo?.token ?? '');
          Get.deleteAll();
          Get.toNamed(Routes.HOME);
        }
      }
    } finally {
      loginProcess(false);
    }
  }


}