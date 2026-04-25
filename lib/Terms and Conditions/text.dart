import 'package:defectscan/controller/Terms%20and%20Conditions/terms_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showTermsDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Terms",
    barrierColor: Colors.black.withOpacity(0.45),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Material(
          // color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.88,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 25,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(0.1),
                  ),
                  child: const Icon(
                    Icons.verified_user_outlined,
                    size: 34,
                    color: Colors.blue,
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Please read carefully:",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 14),

                    Text(
                      "1. All scan results are AI-generated and may require manual review.",
                      // style: TextStyle(fontSize: 14, height: 1.7),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "2. Your uploaded images and data are stored securely and remain private.",
                      // style: TextStyle(fontSize: 14, height: 1.7),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "3. We do not share your information with any third party.",
                      // style: TextStyle(fontSize: 14, height: 1.7),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "4. By clicking 'I Agree', you accept our terms and privacy policy.",
                      // style: TextStyle(fontSize: 14, height: 1.7),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: Get.back,
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    GetBuilder<TermsCont>(
                      builder: (controller) {
                        return Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              controller.acceptTerms();
                              Get.back();
                            },
                            child: const Text(
                              "I Agree",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, animation, __, child) {
      return Transform.scale(
        scale: animation.value,
        child: Opacity(opacity: animation.value, child: child),
      );
    },
  );
}
