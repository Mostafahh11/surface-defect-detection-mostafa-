import 'package:defectscan/Home/dashboard/dashboard_widgets.dart';
import 'package:flutter/material.dart';



class Dashboard extends StatelessWidget {
 const Dashboard({super.key});



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
