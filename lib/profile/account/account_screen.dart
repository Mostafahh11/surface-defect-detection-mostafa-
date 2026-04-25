import 'package:defectscan/constants/colors/colors.dart';
import 'package:defectscan/features/change_Mail_screens/email_page.dart';
import 'package:defectscan/profile/account/account_widgets.dart';
import 'package:defectscan/profile/change_number/change_number.dart';
import 'package:defectscan/profile/remove%20account/remove_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Settings"),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _sectionTitle("Account"),
          _buildTile(
            Icons.email,
            "Email Address",
            "Change your email",
            () => Get.to(() => EmailAddressScreen()),
          ),
          _buildTile(
            Icons.phone,
            "Phone Number",
            "Update your number",
            () => Get.to(() => ChangeNumberPage()),
          ),

          const SizedBox(height: 20),

          _sectionTitle("Security"),
          _buildTile(
            Icons.lock,
            "Change Password",
            "Update your password",
            () {},
          ),

          const SizedBox(height: 20),

          _sectionTitle("Danger Zone"),
          _buildTile(
            Icons.delete,
            "Remove Account",
            "Permanently delete account",
            () => Get.to(() => RemoveAccountPage()),
            color: Colors.red,
          ),

          const SizedBox(height: 30),

          _logoutButton(),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildTile(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap, {
    Color color = Colors.blue,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }

  Widget _logoutButton() {
    return ElevatedButton(
      onPressed: () {
        showLogoutDialog();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Mycolors.org,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text(
        'Logout',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
