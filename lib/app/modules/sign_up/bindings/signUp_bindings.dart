import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/modules/sign_up/controllers/signup_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpScreenController>(() => SignUpScreenController());
  }
}