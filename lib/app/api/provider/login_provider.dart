import 'dart:developer';

import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/api/client/api_client.dart';
import 'package:wedevs_flutter_project/app/data/model/user_model.dart';
import 'package:wedevs_flutter_project/app/utils/helper/view_helper.dart';
import 'package:dio/dio.dart' as DIO;

class LoginProvider extends GetxService {
  final ApiClient _apiClient = Get.find();

  Future<UserModel?> signInWithUserNamePassword(
      {String? email, String? password}) async {
    try {
      Map<String, dynamic> data = {"username": email, "password": password};
      DIO.Response response = await _apiClient
          .request("wp-json/jwt-auth/v1/token", Method.POST, body: data);
      return UserModel.fromJson(response.data);
    } on Exception catch (e) {
      showMessageSnackbar(e.toString());
    }
  }

  Future<UserModel?> getUserDetails () async
  {
    try {
      DIO.Response response = await _apiClient.request("wp-json/wp/v2/users/me",Method.GET);
      if (response.statusCode == 200)
      {
        //log("response usr : ${response.data}");
        return UserModel.fromJson(response.data);
      }
    } catch (e) {
      e.printError();
    }
  }

}
