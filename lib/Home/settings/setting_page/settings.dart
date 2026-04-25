import 'package:defectscan/Home/settings/Notificationes/notification_screen.dart';
import 'package:defectscan/Home/settings/setting_page/setting_widgets.dart';
import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:defectscan/controller/theme_cont/theme_cont.dart';
import 'package:defectscan/features/invite_screen/invite_screen.dart';
import 'package:defectscan/features/themes/themePage.dart';
import 'package:defectscan/privacy/Privacy_screen.dart';
import 'package:defectscan/profile/account/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final ProfileCont controller2 = Get.put(ProfileCont());
  final ThemeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ProfileHeader(),
        Divider(height: 40),
        SettingTile(
          icon: Icons.person_outline,
          title: 'Account',
          onTap: () {
            Get.to(() => AccountScreen());
          },
        ),
        SettingTile(
          icon: Icons.notifications_none,
          title: 'Notifications',
          onTap: () {
            Get.to(() => NotificationsScreen());
          },
        ),
        SettingTile(
          icon: Icons.lock_outline,
          title: 'Privacy & Security',
          onTap: () {
            Get.to(() => PrivacyScreen());
          },
        ),
        SettingTile(
          icon: Icons.people_outline,
          title: 'Invite Friends',
          onTap: () {
            Get.to(() => InviteScreen());
          },
        ),
        SettingTile(
          icon: Icons.palette_outlined,
          title: 'Theme',
          onTap: () {
            Get.to(() => ThemeScreen());
          },
        ),
        SettingTile(icon: Icons.language, title: 'Languages', onTap: () {}),
        SettingTile(
          icon: Icons.headset_mic_outlined,
          title: 'Ask an Expert',

          onTap: () {},
        ),
      ],
    );
  }
}
