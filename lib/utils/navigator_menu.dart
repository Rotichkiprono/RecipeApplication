import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipetrial/controllers/navigationcontroller.dart';

class Navigatormenu extends StatelessWidget {
  const Navigatormenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(navigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0.0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected:(index) => controller.selectedIndex.value = index, 
        
          destinations: const[
            NavigationDestination(icon: Icon(Icons.home),label: "home",),
            NavigationDestination(icon: Icon(Icons.search),label: "search",),
            NavigationDestination(icon: Icon(Icons.person),label: "profile",),
            
          ],
        ),
      ),
      body:Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}