import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/modules/cart/bindings/cart_bindings.dart';
import 'package:wedevs_flutter_project/app/modules/cart/views/cart_views.dart';
import 'package:wedevs_flutter_project/app/modules/home/bindings/home_bindings.dart';
import 'package:wedevs_flutter_project/app/modules/home/views/home_views.dart';
import 'package:wedevs_flutter_project/app/modules/home_screen/bindings/home_screen_binding.dart';
import 'package:wedevs_flutter_project/app/modules/home_screen/views/home_screen_view.dart';
import 'package:wedevs_flutter_project/app/modules/login/bindings/login_bindings.dart';
import 'package:wedevs_flutter_project/app/modules/login/views/login_view.dart';
import 'package:wedevs_flutter_project/app/modules/menu/bindings/menu_bindings.dart';
import 'package:wedevs_flutter_project/app/modules/menu/views/menu_view.dart';
import 'package:wedevs_flutter_project/app/modules/profile/bindings/profile_binding.dart';
import 'package:wedevs_flutter_project/app/modules/profile/views/profile_view.dart';
import 'package:wedevs_flutter_project/app/modules/search/bindings/search_bindings.dart';
import 'package:wedevs_flutter_project/app/modules/search/views/search_view.dart';
import 'package:wedevs_flutter_project/app/modules/sign_up/bindings/signUp_bindings.dart';
import 'package:wedevs_flutter_project/app/modules/sign_up/controllers/signup_controller.dart';
import 'package:wedevs_flutter_project/app/modules/sign_up/views/signup_view.dart';



part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;


  static final routes = [
    GetPage(
      name: _Paths.login,
      page: () => LoginScreenView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignUpScreenView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => MenuScreenView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartScreenView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileScreenView(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchScreenView(),
      binding: SearchBinding(),
    ),
  ];
}
