import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/api/client/api_client.dart';
import 'package:wedevs_flutter_project/app/data/model/sign_up_response.dart';
import 'package:dio/dio.dart' as DIO;

class SignUpProvider extends GetxService{

  final ApiClient _apiClient = Get.find();

  Future<SignUpResponse?> signUpWithUserNameEmailPassword ({String? email,String? password, String? userName, }) async
  {
    try {
      Map<String,dynamic> data = {
        "username": userName,
        "email": email,
        "password": password,
      };
      DIO.Response response = await _apiClient.request("wp-json/wp/v2/users/register", Method.POST, body: data);
      if(response.statusCode == 200) {
        return SignUpResponse.fromJson(response.data);
      } else{
          Get.snackbar(" Error",response.statusMessage??"",snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      e.printError();
    }
  }
}