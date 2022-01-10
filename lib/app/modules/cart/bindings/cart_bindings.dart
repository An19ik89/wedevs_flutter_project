import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/modules/cart/controllers/cart_screen_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartScreenController>(() => CartScreenController());
  }
}