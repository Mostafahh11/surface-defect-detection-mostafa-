import 'package:defectscan/Home/recent_activites/acitvity_widgets.dart';
import 'package:flutter/material.dart';

class RecentActivityPage extends StatelessWidget {
  const RecentActivityPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recent Activity"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          ActivityItem(
            title: "Steel Plate A-47",
            id: "SC-2047",
            time: "2 min ago",
            zone: "A",
            defects: "0",
            icon: Icons.check_circle,
            iconColor: Colors.green,
            percent: '99.2',
          ),
          ActivityItem(
            title: "Beam Section B-12",
            id: "SC-2046",
            time: "15 min ago",
            zone: "C",
            defects: "2",
            icon: Icons.error,
            iconColor: Colors.orange,
            percent: '97.2',
          ),
          ActivityItem(
            title: "Rod Bundle C-89",
            id: "SC-2045",
            time: "32 min ago",
            zone: "B",
            defects: "5",
            icon: Icons.cancel,
            iconColor: Colors.red,
            percent: '96.1',
          ),
        ],
      ),
    );
  }
}
