import 'package:defectscan/Home/history/history_widgets.dart';
import 'package:defectscan/Home/recent_activites/recent_activity_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Text(
            'History',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "Defect Categories",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: CircularProgressIndicator.strokeAlignCenter,
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, i) {
                  return DefectCategoryRow(
                    icon: Icons.remove,
                    label: "Scratches",
                    cases: "34",
                    percentage: 0.39,
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 20),
          ListTile(
            title: Text(
              "Recent Activity",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              "Latest Scan Result",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),

            trailing: TextButton(
              onPressed: () {
                Get.to(() => RecentActivityPage());
              },
              child: Text(
                "View All",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff337037),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
