import 'package:defectscan/Home/settings/setting_page/setting_widgets.dart';
import 'package:defectscan/profile/change_number/change_number.dart';
import 'package:defectscan/profile/remove%20account/remove_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SettingsTile(
              title: "Email Address",
              icon: Icons.email,
              onTap: () {
                // Get.to((){});
              },
            ),
            SettingsTile(
              title: "Change Number",
              icon: Icons.phone,
              onTap: () {
                Get.to(() => ChangeNumberPage());
              },
            ),
            SettingsTile(
              title: "Remove Account",
              icon: Icons.delete,
              onTap: () {
                Get.to(() => RemoveAccountPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
