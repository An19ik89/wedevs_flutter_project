import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/modules/home/controllers/home_controller.dart';
import 'package:wedevs_flutter_project/app/utils/res/colors.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => SafeArea(
              bottom: true,
              left: true,
              right: true,
              top: true,
              child: Scaffold(
                extendBody: true,
                backgroundColor: CustomColors.KAshBg1,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0, 5),
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(90),
                    gradient: const LinearGradient(
                        colors: [CustomColors.KPink, CustomColors.KPinkOrange]),
                  ),
                  child: FloatingActionButton(
                    isExtended: true,
                    elevation: 0,
                    onPressed: () {},
                    child: SvgPicture.asset(
                      'assets/icons/ic_search.svg',
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                bottomNavigationBar: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: BottomAppBar(
                    elevation: 0,
                    shape: const CircularNotchedRectangle(),
                    notchMargin: 5.0,
                    clipBehavior: Clip.antiAlias,
                    color: CustomColors.KAshBg1,
                    child: SizedBox(
                      height: 60,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        child: BottomNavigationBar(
                          elevation: 20,
                          backgroundColor: Colors.white,
                          type: BottomNavigationBarType.fixed,
                          currentIndex: controller.selectedIndex,
                          selectedItemColor: CustomColors.KReddishColor,
                          unselectedItemColor: CustomColors.KAshColor,
                          showUnselectedLabels: false,
                          showSelectedLabels: false,
                          onTap: (index) => controller.onTabChange(index),
                          items: <BottomNavigationBarItem>[
                            BottomNavigationBarItem(
                                icon: SvgPicture.asset(
                                  'assets/icons/ic_bottom_home.svg',
                                  color: controller.selectedIndex == 0
                                      ? CustomColors.KReddishColor
                                      : CustomColors.KAshColor,
                                ),
                                label: ''),
                            BottomNavigationBarItem(
                                icon: SvgPicture.asset(
                                  'assets/icons/ic_bottom_combined_shape.svg',
                                  color: controller.selectedIndex == 1
                                      ? CustomColors.KReddishColor
                                      : CustomColors.KAshColor,
                                ),
                                label: ''),
                            // BottomNavigationBarItem(
                            //     icon: SvgPicture.asset(
                            //       'assets/icons/ic_bottom_combined_shape.svg',
                            //       color: controller.selectedIndex == 2
                            //           ? CustomColors.KReddishColor
                            //           : CustomColors.KAshColor,
                            //     ),
                            //     label: ''),
                            BottomNavigationBarItem(
                                icon: SvgPicture.asset(
                                  'assets/icons/ic_bottom_cart.svg',
                                  color: controller.selectedIndex == 2
                                      ? CustomColors.KReddishColor
                                      : CustomColors.KAshColor,
                                ),
                                label: ''),
                            BottomNavigationBarItem(
                                icon: SvgPicture.asset(
                                  'assets/icons/ic_bottom_profile.svg',
                                  color: controller.selectedIndex == 3
                                      ? CustomColors.KReddishColor
                                      : CustomColors.KAshColor,
                                ),
                                label: ''),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                body: IndexedStack(
                  index: controller.selectedIndex,
                  children: controller.screenList,
                ),
              ),
            ));
  }
}
