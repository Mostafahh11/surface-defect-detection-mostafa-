import 'package:defectscan/Home/settings/Notificationes/notification_screen.dart';
import 'package:defectscan/Home/settings/setting_page/setting_widgets.dart';
import 'package:defectscan/controller/profile_cont/profile_cont.dart';
import 'package:defectscan/features/invite_screen/invite_screen.dart';
import 'package:defectscan/features/themes/light&dark_mode/light&dark_mode.dart';
import 'package:defectscan/privacy/Privacy_screen.dart';
import 'package:defectscan/profile/account/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final ProfileCont controller = Get.put(ProfileCont());
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Settings',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        UserProfileHeader(),
        Divider(height: 40),
        SettingsTile(
          icon: Icons.person_outline,
          title: 'Account',
          onTap: () {
            Get.to(() => AccountScreen());
          },
        ),
        SettingsTile(
          icon: Icons.notifications_none,
          title: 'Notifications',
          onTap: () {
            Get.to(() => NotificationsScreen());
          },
        ),
        SettingsTile(
          icon: Icons.lock_outline,
          title: 'Privacy & Security',
          onTap: () {
            Get.to(() => PrivacyScreen());
          },
        ),
        SettingsTile(
          icon: Icons.people_outline,
          title: 'Invite Friends',
          onTap: () {
            Get.to(() => InviteScreen());
          },
        ),
        SettingsTile(
          icon: Icons.palette_outlined,
          title: 'Theme',
          onTap: () {
            Get.to(() => ThemeScreen());
          },
        ),
        SettingsTile(icon: Icons.language, title: 'Languages', onTap: () {}),
        SettingsTile(
          icon: Icons.headset_mic_outlined,
          title: 'Ask an Expert',
          trailingText: 'Upgrade for access',
          onTap: () {},
        ),
      ],
    );
  }
}
