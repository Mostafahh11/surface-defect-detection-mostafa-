import 'package:defectscan/constants/colors/colors.dart';
import 'package:defectscan/features/change_Mail_screens/change_mail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailAddressScreen extends StatelessWidget {
  final String currentEmail = "MostafaHassan@gmail.com";
  const EmailAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Email address")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Stay Connected & Secure\n\n"
              "Your email address is the bridge between you and your SteelScan account. "
              "By keeping it updated, you’ll receive instant updates on your steel defect inspections and important security notices directly in your inbox.\n\n"
              "In case you ever forget your password, your verified email will be the only way to recover your account safely. "
              "We value your privacy and will never share your email with third parties.\n\n"
              "Currently connected as: $currentEmail",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ChangeEmailScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Mycolors.org,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Change Email',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
