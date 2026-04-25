// 4️⃣ Email Changed Success Screen
import 'package:defectscan/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailChangedScreen extends StatelessWidget {
  const EmailChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email, size: 80, color: Colors.blue),
              SizedBox(height: 20),
              Text(
                "Email changed",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Your email has been changed successfully",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed('/mainscaffold');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Mycolors.org,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Back Home',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
