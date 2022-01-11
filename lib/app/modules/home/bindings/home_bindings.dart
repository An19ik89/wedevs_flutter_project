import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/modules/cart/controllers/cart_screen_controller.dart';
import 'package:wedevs_flutter_project/app/modules/home/controllers/home_controller.dart';
import 'package:wedevs_flutter_project/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:wedevs_flutter_project/app/modules/menu/controllers/menu_screen_controller.dart';
import 'package:wedevs_flutter_project/app/modules/profile/controllers/profile_screen_controllers.dart';
import 'package:wedevs_flutter_project/app/modules/search/controllers/search_screen_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.lazyPut<CartScreenController>(() => CartScreenController());
    Get.lazyPut<MenuScreenController>(() => MenuScreenController());
    Get.lazyPut<ProfileScreenController>(() => ProfileScreenController());
    Get.lazyPut<SearchScreenController>(() => SearchScreenController());
  }
}