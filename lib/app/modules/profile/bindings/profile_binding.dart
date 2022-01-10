import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/modules/profile/controllers/profile_screen_controllers.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileScreenController>(() => ProfileScreenController());
  }
}