import 'package:defectscan/constants/colors/colors.dart';
import 'package:defectscan/profile/remove%20account/account_removed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemoveAccountPage extends StatelessWidget {
  const RemoveAccountPage({super.key});

  void showConfirmDialog() {
    Get.defaultDialog(
      radius: 16,
      title: "Are you sure?",
      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.to(() => AccountRemovedPage());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Mycolors.org,
              minimumSize: const Size(double.infinity, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Remove Account',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          TextButton(onPressed: () => Get.back(), child: const Text("Cancel")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Remove account")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Removing your account will permanently erase all your data from the app, including:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            _warningItem("Inspection records"),
            _warningItem("Uploaded images"),
            _warningItem("Detection results and reports"),

            const SizedBox(height: 20),

            const Text("This action is permanent and cannot be undone."),

            const Spacer(),
            ElevatedButton(
              onPressed: () {
                showConfirmDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Mycolors.org,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Remove Account',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _warningItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.orange),
          const SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
