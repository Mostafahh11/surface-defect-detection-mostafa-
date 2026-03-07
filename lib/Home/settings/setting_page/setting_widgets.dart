import 'package:defectscan/profile/profile_page/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailingText;

  final void Function()? onTap;
  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailingText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon, size: 22),
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        trailing: trailingText != null
            ? Text(
                trailingText!,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Icon(Icons.chevron_right, color: Colors.grey),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: Icon(Icons.person, color: Colors.grey, size: 30),
        ),
        const SizedBox(width: 15),
        InkWell(
          onTap: () {
            Get.to(() => MyProfileScreen());
          },
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mostafa Hassan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.edit, size: 25),
          onPressed: () {
            Get.to(() => MyProfileScreen());
          },
        ),
        IconButton(
          icon: const Icon(Icons.qr_code_scanner, size: 30),
          onPressed: () {},
        ),
      ],
    );
  }
}
