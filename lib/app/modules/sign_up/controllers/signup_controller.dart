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
      log("SignUp resp in controller : ${signUpResponse}");
      if(signUpResponse?.code == 200){
        // Get.defaultDialog(title: "Congratulation!", middleText: signUpResponse!.message.toString(),onConfirm:(){
        //   Get.back(closeOverlays: true);
        // },barrierDismissible:false,textConfirm: "Done");
        Get.deleteAll();
        Get.toNamed(Routes.HOME);

      }else{
        Get.defaultDialog(title: "Warning!", middleText: (signUpResponse?.message).toString());
      }
    }finally{
      signUpProcess(false);
    }

  }


  onImageButtonPressed(ImageSource source){
    try {
      final pickedFile = picker.pickImage(
        source: source,
        maxWidth: 150,
        maxHeight: 150,
        imageQuality: 100,
      );
    } catch (e) {

    }
  }

}