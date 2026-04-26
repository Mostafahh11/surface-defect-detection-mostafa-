// ignore_for_file: deprecated_member_use

import 'package:defectscan/Home/dashboard/dashboard_widgets.dart';
import 'package:defectscan/core/service/sharedpreff.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final StorageService sharedpreff = StorageService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            profileCard(context),
            const SizedBox(height: 20),
            cameraScan(context),
            const SizedBox(height: 15),
            secondaryActions(context),
          ],
        ),
      ),
    );
  }
}
