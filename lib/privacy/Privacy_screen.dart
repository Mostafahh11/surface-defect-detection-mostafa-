import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy & Security")),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 13),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Effective Date: January 1, 2026\n",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              Text(
                "At our application, your privacy and security are extremely important to us. "
                "This policy explains how we collect, use, protect, and handle your personal information when you use our services.\n",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              Text(
                "1. Information We Collect.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              Text(
                "We may collect the following types of information:\n"
                "- Personal Information: Name, email address, phone number, and profile photo.\n"
                "- Account Information: Login credentials and authentication data.\n"
                "- Device Information: Device type, operating system, and app version.\n"
                "- Usage Data: Pages visited, features used, and interaction patterns.\n"
                "- Technical Data: IP address, crash reports, and performance logs.\n",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              Text(
                "2. How We Use Your Information",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              Text(
                "We use your data to:\n"
                "- Provide and improve our services.\n"
                "- Personalize your experience.\n"
                "- Send notifications and important updates.\n"
                "- Ensure account security.\n"
                "- Prevent fraud and unauthorized access.\n"
                "- Comply with legal obligations.\n",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              Text(
                "3. Data Storage and Security",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              Text(
                "We implement industry-standard security measures to protect your data:\n"
                "- Encrypted communication (HTTPS).\n"
                "- Secure authentication systems.\n"
                "- Restricted internal access to sensitive data.\n"
                "- Regular monitoring and security updates.\n"
                "Despite our efforts, no system is completely secure. However, we continuously improve our protection mechanisms.\n",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              Text(
                "4. Sharing of Information",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              Text(
                "We do not sell your personal information. We may share data only in the following cases:\n"
                "- With trusted service providers who help operate the app.\n"
                "- If required by law or legal process.\n"
                "- To protect our rights and users’ safety.\n",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              Text(
                "5. Your Rights",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              Text(
                "You have the right to:\n"
                "- Access your personal data.\n"
                "- Request correction of inaccurate information.\n"
                "- Request deletion of your account.\n"
                "- Withdraw consent where applicable.\n"
                "- Disable notifications at any time.\n",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              Text(
                "6. Data Retention",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              Text(
                "We retain your information only as long as necessary to provide services or comply with legal requirements. When no longer needed, data is securely deleted.\n",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              Text(
                "7. Children's Privacy",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              Text(
                "Our services are not intended for children under 13 years old. We do not knowingly collect personal information from children.\n",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              Text(
                "8. Changes to This Policy",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              Text(
                "We may update this Privacy Policy from time to time. Any changes will be reflected within the app. Continued use of the service means you accept the updated policy.\n",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              Text(
                "9. Contact Us",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              Text(
                "If you have any questions about this Privacy & Security Policy, please contact us at:\n"
                "support@yourapp.com\n"
                "Your trust is important to us. We are committed to protecting your privacy and maintaining a secure environment for all users.",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
