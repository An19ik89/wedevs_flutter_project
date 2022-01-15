import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wedevs_flutter_project/app/api/repository/profile_repository.dart';
import 'package:wedevs_flutter_project/app/data/model/user_model.dart';

class ProfileScreenController extends GetxController {

  RxList expandingListValue = [].obs;
  final ProfileRepository profileRepository = Get.find();
  final userInfo = GetStorage();


  RxString name ="".obs;
  RxString email ="".obs;
  RxString avatar ="".obs;


  @override
  void onInit() {
    super.onInit();
    for (int i=0;i<4;i++) {
      expandingListValue.add(false);
    }
    userDetails();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  expandedBox(val,index){
    val == false ? expandingListValue.value[index]=true : expandingListValue.value[index]=false  ;
    update();
  }

  userDetails() async{
    UserModel? model = await profileRepository.getUserDetails();
    name.value = model!.name! ;
    avatar.value = model.avatarUrls!["96"]! ;
    email.value = userInfo.read('user_email');
    update();
    //avatar.value = "https://secure.gravatar.com/avatar/?s=96&d=mm&r=g";
    //print("name : ${name.value}");
    //print("name : ${avatar.value}");
  }
}