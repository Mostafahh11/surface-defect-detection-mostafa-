import 'package:defectscan/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountRemovedPage extends StatelessWidget {
  const AccountRemovedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xffE6E9F2),
              child: Icon(Icons.person, size: 60),
            ),
            const SizedBox(height: 20),

            const Text(
              "Account Removed",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Your account has been removed successfully",
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Get.offAllNamed('mainscaffold');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Mycolors.org,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Go Home',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
