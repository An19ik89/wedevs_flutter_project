import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/modules/search/controllers/search_screen_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchScreenController>(() => SearchScreenController());
  }
}