import 'package:get/get.dart';

class ProfileScreenController extends GetxController {

  RxList expandingListValue = [].obs;

  @override
  void onInit() {
    super.onInit();

    for (int i=0;i<4;i++) {
      expandingListValue.add(false);
    }

  }
  expandedBox(val,index){
    val == false ? expandingListValue.value[index]=true : expandingListValue.value[index]=false  ;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

}