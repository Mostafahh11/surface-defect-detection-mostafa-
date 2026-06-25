import 'package:defectscan/Home/navigation_menu/app_bar_app/notification_widget.dart';
import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Titlebar extends StatelessWidget {
  Titlebar({super.key});

  final ProfileCont controller = Get.isRegistered<ProfileCont>()
      ? Get.find<ProfileCont>()
      : Get.put(ProfileCont());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Defect Scan",
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              notification_widget(),
              const SizedBox(width: 15),

              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200],

                child: Icon(Icons.person, size: 20, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
