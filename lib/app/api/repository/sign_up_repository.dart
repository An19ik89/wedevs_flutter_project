import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/api/provider/sign_up_provider.dart';
import 'package:wedevs_flutter_project/app/data/model/sign_up_response.dart';

class SignUpRepository extends GetxService{

  final SignUpProvider signUpProvider = Get.find();

  Future<SignUpResponse?> signUpWithEmailUsernamePassword({String? email,String? password,String? userName}){
    return signUpProvider.signUpWithUserNameEmailPassword(email: email,password: password,userName: userName);
  }
}