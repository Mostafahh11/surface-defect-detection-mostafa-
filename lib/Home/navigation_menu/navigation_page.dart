import 'package:defectscan/Home/navigation_menu/app_bar_app/title_bar.dart';
import 'package:defectscan/Home/navigation_menu/navigation_bar_widgets.dart';
import 'package:defectscan/controller/Detection_Cont/detectionCont.dart';
import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:defectscan/controller/navigation_controller/navigationbar_controller.dart';

class MainScaffold extends StatelessWidget {
  MainScaffold({super.key});
   final ProfileCont controller2 = Get.isRegistered<ProfileCont>()
      ? Get.find<ProfileCont>()
      : Get.put(ProfileCont());
  final NavigationbarController controller = Get.put(NavigationbarController());
  final ScanController mediaController = Get.put(ScanController());
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Titlebar(),

           Expanded(
  child: Obx(
    () => IndexedStack(
      index: controller.selectedindex.value,
      children: controller.pages,
    ),
  ),

            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
       
        padding: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
        height: 100,
        color: Colors.transparent, // أهم خطوة عشان ميبانش فيه خلفية بيضاء وراه
        child: Container(
          decoration: BoxDecoration(
            // بيقرأ اللون من الثيم (surface) عشان يفضل متناسق
            color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
            borderRadius: BorderRadius.circular(
              30,
            ), 
            border: Border.all(
              color: Theme.of(context).dividerColor.withOpacity(0.1),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 20, 
                offset: const Offset(
                  0,
                  10,
                ), // اتجاه الشادو لتحت عشان يبان إنه "طالع" لفوق
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              30,
            ), // عشان أي تأثير ضغطة ميبوظش الحواف
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(controller.navIcons.length, (index) {
                return Obx(() {
                  final isSelected = controller.selectedindex.value == index;
                  return buildWebNavItem(
                    icon: controller.navIcons[index],
                    label: controller.titles[index],
                    isSelected: isSelected,
                    onTap: () => controller.selectedindex.value = index,
                  );
                });
              }),
            ),
          ),
        ),
      ),
    );
  }

  // الـ Widget الخاص بكل عنصر في الـ Dock
}
