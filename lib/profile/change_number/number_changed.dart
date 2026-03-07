import 'package:defectscan/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneChangedSuccess extends StatelessWidget {
  const PhoneChangedSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.phone, size: 90),
              const SizedBox(height: 20),

              const Text(
                "Phone Number Changed",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Text(
                "Your phone number has been changed successfully",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

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
                  'Go Home',
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
