import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/modules/menu/controllers/menu_screen_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuScreenController>(() => MenuScreenController());
  }
}