import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/api/provider/login_provider.dart';
import 'package:wedevs_flutter_project/app/data/model/user_model.dart';


class LoginRepository extends GetxService {
  final LoginProvider _loginProvider = Get.find();

  Future<UserModel?> signInWithUserNamePassword({String? email,String? password}){
    return _loginProvider.signInWithUserNamePassword(email: email,password: password);
  }

  Future<UserModel?> getUserDetails(){
    return _loginProvider.getUserDetails();
  }

}