import 'package:defectscan/controller/Terms%20and%20Conditions/terms_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showTermsDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Terms",
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            constraints: const BoxConstraints(maxHeight: 600),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(0.1),
                  ),
                  child: const Icon(
                    Icons.verified_user_outlined,
                    color: Colors.blue,
                    size: 32,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Terms & Privacy",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 12),

                const Divider(),

                const SizedBox(height: 10),

                // Scrollable content
                const Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _TermItem(
                          text:
                              "All scan results are AI-generated and should be reviewed manually.",
                        ),
                        _TermItem(
                          text:
                              "Your data is stored securely and never shared with third parties.",
                        ),
                        _TermItem(
                          text:
                              "We prioritize user privacy and data protection at all times.",
                        ),
                        _TermItem(
                          text:
                              "By pressing Agree, you accept all terms and conditions.",
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Get.back(),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GetBuilder<TermsCont>(
                        builder: (controller) {
                          return ElevatedButton(
                            onPressed: () {
                              controller.acceptTerms();
                              Get.back();
                          
                              // optional save
                              // GetStorage().write("accepted_terms", true);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              "Agree",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }
                      ),
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
      return ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        child: FadeTransition(opacity: animation, child: child),
      );
    },
  );
}

class _TermItem extends StatelessWidget {
  final String text;

  const _TermItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(color: Colors.blue, fontSize: 18)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.grey.shade700, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
