import 'package:defectscan/Home/navigation_menu/app_bar_app/title_bar.dart';
import 'package:defectscan/Home/navigation_menu/navigation_bar_widgets.dart';
import 'package:defectscan/controller/navigation_controller/navigationbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScaffold extends StatelessWidget {
  MainScaffold({super.key});

  final NavigationbarController controller = Get.put(NavigationbarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(() {
              return controller.selectedindex.value ==
                      controller.pages.length - 1
                  ? const SizedBox.shrink()
                  : SizedBox(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Titlebar(),
                      ),
                    );
            }),

            Expanded(
              child: Obx(() {
                return IndexedStack(
                  index: controller.selectedindex.value,
                  children: controller.pages,
                );
              }),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Obx(() {
        return AppBottomNav(
          currentIndex: controller.selectedindex.value,
          onTap: (index) {
            controller.selectedindex.value = index;
          },
        );
      }),
    );
  }
}
