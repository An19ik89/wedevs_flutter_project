import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/api/provider/profile_provider.dart';
import 'package:wedevs_flutter_project/app/data/model/update_user_response.dart';
import 'package:wedevs_flutter_project/app/data/model/user_model.dart';

class ProfileRepository extends GetxService {
  final ProfileProvider _profileProvider = Get.find();

  Future<UserModel?> getUserDetails(){
    return _profileProvider.getUserDetails();
  }

  Future<UpdatedUserResponse?> updateProfile({String? name,String?email}){
    return _profileProvider.updateProfile();
  }
}