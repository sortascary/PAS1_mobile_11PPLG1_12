import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_12/Controllers/Dashboard_controller.dart';
import 'package:pas1_mobile_11pplg1_12/Menus/favourite_menu.dart';
import 'package:pas1_mobile_11pplg1_12/Menus/profile_menu.dart';
import 'package:pas1_mobile_11pplg1_12/Menus/teams_menu.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    
    final DashboardController dashboardController = Get.find();

    final List<Widget> menus = [TeamsMenu(), FavouriteMenu(), ProfileMenu()];

     return LayoutBuilder(
      builder: (context, constraints) {
        return Obx(() {
          return Scaffold(
            body: menus[dashboardController.selectedIndex.value],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: dashboardController.selectedIndex.value,
              onTap: dashboardController.changeMenu,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports_soccer_outlined), label: "Teams"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorites"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_outlined), label: "Profile"),
              ],
            ),
          );
        });
      },
    );
  }
}