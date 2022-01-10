import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wedevs_flutter_project/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.selectedIndex,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,
                onTap: (index) => controller.onTabChange(index),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/ic_bottom_home.svg',
                      ),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/ic_bottom_combined_shape.svg',
                        color: controller.selectedIndex == 1
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      label: "Menu"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/ic_bottom_combined_shape.svg',
                        color: controller.selectedIndex == 2
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      label: "Search"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/ic_bottom_cart.svg',
                        color: controller.selectedIndex == 3
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      label: "Cart"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icons/ic_bottom_profile.svg',
                        color: controller.selectedIndex == 4
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      label: "Profile"),
                ],
              ),
              body: IndexedStack(
                index: controller.selectedIndex,
                children: controller.screenList,
              ),
            ));
  }
}
