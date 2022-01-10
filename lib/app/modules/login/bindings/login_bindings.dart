import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/modules/login/controllers/login_screen_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
  }
}