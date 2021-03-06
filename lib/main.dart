import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedevs_flutter_project/app/api/client/api_client.dart';
import 'package:wedevs_flutter_project/app/api/provider/login_provider.dart';
import 'package:wedevs_flutter_project/app/api/provider/profile_provider.dart';
import 'package:wedevs_flutter_project/app/api/provider/sign_up_provider.dart';
import 'package:wedevs_flutter_project/app/api/repository/login_repository.dart';
import 'package:wedevs_flutter_project/app/api/repository/profile_repository.dart';
import 'package:wedevs_flutter_project/app/api/repository/sign_up_repository.dart';
import 'package:wedevs_flutter_project/app/data/local/local_storage.dart';
import 'package:wedevs_flutter_project/app/routes/app_pages.dart';
import 'package:wedevs_flutter_project/app/utils/helper/utility.dart';
import 'package:wedevs_flutter_project/app/utils/res/colors.dart';

void main() async {
  await GetStorage.init();
  Get.put<LocalStorage>(LocalStorage());
  await Get.putAsync<ApiClient>(() => ApiClient().init());
  await Get.putAsync<LoginProvider>(() async => LoginProvider());
  await Get.putAsync<LoginRepository>(() async => LoginRepository());
  await Get.putAsync<SignUpProvider>(() async => SignUpProvider());
  await Get.putAsync<SignUpRepository>(() async => SignUpRepository());
  await Get.putAsync<ProfileProvider>(() async => ProfileProvider());
  await Get.putAsync<ProfileRepository>(() async => ProfileRepository());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(CustomColors.KPrimaryBlueColor),
        textTheme: GoogleFonts.latoTextTheme(),
        iconTheme: IconThemeData(color:CustomColors.KLiteBlackColor),
      ),
      title: "Swap",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.rightToLeft,

    );
  }
}
