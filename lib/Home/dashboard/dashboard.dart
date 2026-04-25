// ignore_for_file: deprecated_member_use

import 'package:defectscan/Home/Defect_images/historyscans.dart';
import 'package:defectscan/Home/dashboard/dashboard_widgets.dart';
import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:defectscan/controller/theme_cont/theme_cont.dart';
import 'package:defectscan/core/service/sharedpreff.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  final ThemeController controller = Get.find();
  final StorageService sharedpreff = StorageService();
  final ProfileCont controller2 = Get.isRegistered<ProfileCont>()
      ? Get.find<ProfileCont>()
      : Get.put(ProfileCont());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            profileCard(controller, context, controller2),
            const SizedBox(height: 20),
            cameraScan(context),
            const SizedBox(height: 15),
            secondaryActions(context),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                smallAction(
                  Icons.image_rounded,
                  'Photos',
                  "See Selected Images",
                  Colors.red,
                  () {
                    Get.to(() => HistoryScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
