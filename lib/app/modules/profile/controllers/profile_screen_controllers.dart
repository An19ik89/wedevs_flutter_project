import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wedevs_flutter_project/app/api/repository/profile_repository.dart';
import 'package:wedevs_flutter_project/app/data/model/update_user_response.dart';
import 'package:wedevs_flutter_project/app/data/model/user_model.dart';

class ProfileScreenController extends GetxController {

  RxList expandingListValue = [].obs;
  final ProfileRepository profileRepository = Get.find();
  final userInfo = GetStorage();
  UpdatedUserResponse? userLoggedInInfoAfterUpdate = UpdatedUserResponse(name: '', firstName: '', lastName: '',email: '',nickname: '');
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  RxString name ="".obs;
  RxString email ="".obs;
  RxString avatar ="".obs;
  var updateProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
    for (int i=0;i<4;i++) {
      expandingListValue.add(false);
    }
    userDetails();
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
  }

  expandedBox(val,index){
    val == false ? expandingListValue.value[index]=true : expandingListValue.value[index]=false  ;
    update();
  }

  userDetails() async{
    UserModel? model = await profileRepository.getUserDetails();
    name.value = model!.name! ;
    avatar.value = model.avatarUrls!["96"]! ;
    email.value = userInfo.read('user_email');
    update();
  }

  //for server error not complete profile update
  void updateProfile() async
  {
    updateProcess(true);
    try {
      userLoggedInInfoAfterUpdate = await profileRepository.updateProfile(email: emailTextController.text, name: nameTextController.text);
      if (userLoggedInInfoAfterUpdate != null)
      {

      }
    } finally {
      updateProcess(false);
    }
  }
}