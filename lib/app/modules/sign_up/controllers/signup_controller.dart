import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wedevs_flutter_project/app/api/repository/sign_up_repository.dart';
import 'package:wedevs_flutter_project/app/data/model/sign_up_response.dart';
import 'package:wedevs_flutter_project/app/routes/app_pages.dart';

class SignUpScreenController extends GetxController {

  final SignUpRepository signUpRepository = Get.find();
  SignUpResponse? signUpResponse = SignUpResponse(code: 0,message: '',data: null);
  var signUpProcess = false.obs;
  final formKey = GlobalKey<FormState>().obs;
  Rx<XFile>profilePicturePick = XFile("").obs;

  final ImagePicker picker = ImagePicker();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    nameTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
  }

  void signUp() async
  {
    signUpProcess(true);
    try
    {
      signUpResponse =  await signUpRepository.signUpWithEmailUsernamePassword(email: emailTextController.text,password: passwordTextController.text,userName: nameTextController.text);
      if((signUpResponse?.code??0) == 200){
        Get.deleteAll();
        Get.toNamed(Routes.HOME);
      }
      else if((signUpResponse?.code??0) != 200 && (signUpResponse?.code??0) > 0 )
      {
        Get.snackbar(" Error",signUpResponse?.message??"",snackPosition: SnackPosition.BOTTOM);
      }
    }finally{
      signUpProcess(false);
    }

  }

  void selectImage() async {
    final XFile? selected =
    await picker.pickImage(source: ImageSource.gallery);
    if (selected!.path.isNotEmpty) {
      profilePicturePick.value = selected;
    }
  }

}