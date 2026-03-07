import 'package:defectscan/Home/reports/gauge_chart.dart';
import 'package:defectscan/Home/reports/pie_chart.dart';
import 'package:defectscan/Home/reports/statistics_chart.dart';
import 'package:defectscan/constants/colors/colors.dart';
import 'package:flutter/material.dart';

class DetailedReportPage extends StatelessWidget {
  const DetailedReportPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detailed Report")),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("Weekly Overview"),
            subtitle: Text("Defects detected per day"),
            trailing: Icon(Icons.trending_down, color: Colors.red),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.09),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Statistics",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Mycolors.org,
                      ),
                    ),

                    MaterialButton(
                      onPressed: () {},
                      color: Mycolors.org,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: const Text(
                        "Export",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const StatisticsChart(),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Result", style: TextStyle(fontSize: 16)),
                          Text("  Last Week", style: TextStyle(fontSize: 13)),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          Text(
                            "2345",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ResultPieChart(),
                        ],
                      ),
                      Wrap(
                        runSpacing: 12,
                        children: [
                          _valueWithText(124, "Corrosion", 12),
                          _valueWithText(124, "Corrosion", 12),
                          _valueWithText(124, "Corrosion", 12),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: StorageGauge(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _valueWithText(int val, String text, int mixedVal) {
  return SizedBox(
    width: 80,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              val.toString(),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(width: 4),

            Text(
              "(+ $mixedVal)",
              style: const TextStyle(
                color: Colors.greenAccent,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),

        Text(text, style: TextStyle(fontSize: 13)),
      ],
    ),
  );
}

Widget mixedText(String text) {
  return Text(text);
}
