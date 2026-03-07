import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy & Security")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text("""

Effective Date: January 1, 2026

At our application, your privacy and security are extremely important to us. This policy explains how we collect, use, protect, and handle your personal information when you use our services.

1. Information We Collect.

We may collect the following types of information:
- Personal Information: Name, email address, phone number, and profile photo.
- Account Information: Login credentials and authentication data.
- Device Information: Device type, operating system, and app version.
- Usage Data: Pages visited, features used, and interaction patterns.
- Technical Data: IP address, crash reports, and performance logs.

2. How We Use Your Information

We use your data to:
- Provide and improve our services.
- Personalize your experience.
- Send notifications and important updates.
- Ensure account security.
- Prevent fraud and unauthorized access.
- Comply with legal obligations.

3. Data Storage and Security

We implement industry-standard security measures to protect your data:
- Encrypted communication (HTTPS).
- Secure authentication systems.
- Restricted internal access to sensitive data.
- Regular monitoring and security updates.

Despite our efforts, no system is completely secure. However, we continuously improve our protection mechanisms.

4. Sharing of Information

We do not sell your personal information. We may share data only in the following cases:
- With trusted service providers who help operate the app.
- If required by law or legal process.
- To protect our rights and users’ safety.

5. Your Rights

You have the right to:
- Access your personal data.
- Request correction of inaccurate information.
- Request deletion of your account.
- Withdraw consent where applicable.
- Disable notifications at any time.

6. Data Retention

We retain your information only as long as necessary to provide services or comply with legal requirements. When no longer needed, data is securely deleted.

7. Children's Privacy

Our services are not intended for children under 13 years old. We do not knowingly collect personal information from children.

8. Changes to This Policy

We may update this Privacy Policy from time to time. Any changes will be reflected within the app. Continued use of the service means you accept the updated policy.

9. Contact Us

If you have any questions about this Privacy & Security Policy, please contact us at:
support@yourapp.com

Your trust is important to us. We are committed to protecting your privacy and maintaining a secure environment for all users.
            """, style: TextStyle(fontSize: 14, height: 1.6)),
        ),
      ),
    );
  }
}
