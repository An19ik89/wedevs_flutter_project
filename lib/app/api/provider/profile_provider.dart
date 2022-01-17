import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/api/client/api_client.dart';
import 'package:wedevs_flutter_project/app/data/model/update_user_response.dart';
import 'package:wedevs_flutter_project/app/data/model/user_model.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:html/parser.dart';

class ProfileProvider extends GetxService {
  final ApiClient _apiClient = Get.find();

  Future<UserModel?> getUserDetails () async
  {
    try {
      DIO.Response response = await _apiClient.request("wp-json/wp/v2/users/me",Method.GET);
      if (response.statusCode == 200)
      {
        return UserModel.fromJson(response.data);
      }
    } catch (e) {
      e.printError();
    }
  }


  Future<UpdatedUserResponse?> updateProfile ({String? name,String?email}) async
  {
    try {
      Map<String,dynamic> data = {
        "name": name,
        "email": email,
      };
      DIO.Response response = await _apiClient.request("wp-json/wp/v2/users/me",Method.POST,body: data);

      if (response.statusCode == 200)
      {
       return UpdatedUserResponse.fromJson(response.data);
      }
      else
      {
        String error = response.data['message'];
        Get.defaultDialog(title: "Oops!", middleText: _parseHtmlString(error));
      }
    } catch (e) {
      e.printError();
    }
  }
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}