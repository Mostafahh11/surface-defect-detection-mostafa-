import 'package:defectscan/constants/colors/colors.dart';
import 'package:defectscan/profile/change_number/number_changed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNumberPage extends StatelessWidget {
  const ChangeNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Number")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "You can update the phone number linked to your account.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            const Text(
              "New Phone Number",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixText: "+20 ",
                hintText: "0 00 00 00 00",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Get.to(() => PhoneChangedSuccess());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Mycolors.org,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
