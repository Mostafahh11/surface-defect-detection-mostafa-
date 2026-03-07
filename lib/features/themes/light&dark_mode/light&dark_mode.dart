import 'package:defectscan/controller/theme_cont/theme_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeScreen extends StatelessWidget {
  ThemeScreen({super.key});

  final ThemeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Theme")),

      body: Obx(
        () => SwitchListTile(
          title: const Text("Dark Mode"),
          value: controller.isDarkMode.value,
          onChanged: (v) {
            controller.toggleTheme();
          },
        ),
      ),
    );
  }
}
