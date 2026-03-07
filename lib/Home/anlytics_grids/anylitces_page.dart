import 'package:defectscan/Home/anlytics_grids/analytics_widgets.dart';
import 'package:defectscan/Home/reports/reports_page.dart';
import 'package:defectscan/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyticsGrid extends StatelessWidget {
  const AnalyticsGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Analytics Result",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => DetailedReportPage());
                  },
                  child: Text(
                    "See All",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ],
            ),
            Container(
              height: 300,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.18),
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[50],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.trending_up, size: 30, color: Mycolors.org),
                      SizedBox(width: 20),
                      Text(
                        "Quick insights",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (context, index) => mylisttile(
                        Icons.badge_outlined,
                        "Best Performance",
                        "You Have Achived 99.6% accuracy this Week\nthe Best record",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: [
                StatCard(
                  avatarcolor: Colors.green.shade100,
                  icondata: Icons.check_circle_outline,
                  iconscolor: Colors.green,
                  title: 'Passed',
                  value: '1,234',
                  trend: '+12%',
                  color: Color(0xFFE1F5EC),
                ),
                StatCard(
                  avatarcolor: Colors.amber.shade200,
                  icondata: Icons.warning_amber_outlined,
                  iconscolor: Colors.amber,
                  title: 'Defect',
                  value: '76',
                  trend: '-0.8%',
                  color: Colors.amber.shade100,
                ),
                StatCard(
                  avatarcolor: Colors.redAccent.shade100,
                  icondata: Icons.trending_up_outlined,
                  iconscolor: Colors.white60,
                  title: 'Accuracy',
                  value: '98.7%',
                  trend: '+2.3%',
                  color: Color(0xFFFFEBEA),
                ),
                StatCard(
                  avatarcolor: Colors.indigo.shade100,
                  icondata: Icons.history_outlined,
                  iconscolor: Colors.black45,
                  title: 'Batch Scan',
                  value: '1.88s',
                  trend: '-0.5%',
                  color: Color(0xFFE8EAF6),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
