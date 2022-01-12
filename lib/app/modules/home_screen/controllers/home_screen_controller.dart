import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/data/model/product_list_response.dart';

class HomeScreenController extends GetxController {

  RxList result= [].obs;
  RxList checkBoxValue = [].obs;
  List? parsedJson;
  String? data;
  bool? checkingFilterPress;
  @override
  void onInit() {
    super.onInit();
    parsedJson = [];
    checkingFilterPress = false;
    for (int i=0;i<5;i++) {
      checkBoxValue.add(false);
    }
    loadJson();
  }


  @override
  void onClose() {

  }

  loadJson() async {
    data = await rootBundle.loadString('assets/json/response.json');
    //jsonResult = json.decode(data);
    parsedJson = json.decode(data!);
    result.addAll(parsedJson!.map((item) => ResponseData.fromJson(item)).toList());
  }

  pressingCheckbox(index,val){
    checkBoxValue[index] = val!;
    //this is for only single selection
    for(int i = 0; i<checkBoxValue.length;i++){
      if(index != i) checkBoxValue[i] = false;
    }
  }

  clearFilter(){
    checkBoxValue.value.clear();
    result.value.clear();
    for (int i=0;i<5;i++) {
      checkBoxValue.add(false);
    }
    parsedJson = json.decode(data!);
    result.addAll(parsedJson!.map((item) => ResponseData.fromJson(item)).toList());
    update();
  }
  applyFilter()
  {
    for (var element in checkBoxValue) {
      if(element == true) checkingFilterPress = true;
    }
    if(checkingFilterPress == false){
      Get.snackbar(
        "Not Select Anything !",
        "Please select an option :)",
        snackPosition: SnackPosition.BOTTOM,

      );
    }
    else{
      if(checkBoxValue[0] == true){
        result.sort((b, a) => a.id.compareTo(b.id));
      }
      else if(checkBoxValue[1] == true){
        result.sort((a, b) => a.id.compareTo(b.id));
      }
    }

  }
}