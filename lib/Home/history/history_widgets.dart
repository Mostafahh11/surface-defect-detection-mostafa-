import 'package:defectscan/controller/defectCategories/defectcategroies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefectCategoryList extends StatelessWidget {
  final DefectCategoryController controller;

  const DefectCategoryList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final list = controller.history;

      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (list.isEmpty) {
        return const Center(child: Text("No data"));
      }

      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        shrinkWrap: true,

        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          return _buildTile(item, isLast: index == list.length - 1);
        },
      );
    });
  }

  Widget _buildTile(item, {bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: isLast ? 0 : 32,
      ), // مسافة ممتازة بين العناصر زي الصورة
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              /// Icon
              Container(
                height: 60, // كبرت الأيقونة شوية عشان تظبط مع مقاس النص
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                ),
                child: Icon(_getIcon(item.name), size: 25),
              ),
              const SizedBox(width: 16),

              /// Title
              Expanded(
                child: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic, // الخط المائل
                  ),
                ),
              ),

              /// Cases Label (Pill shape)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "${item.cases} cases",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              /// Percentage
              SizedBox(
                width: 42, // تثبيت العرض عشان النسب تحت بعض تترتب صح
                child: Text(
                  "${item.percentage.toStringAsFixed(0)}%",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          /// Progress bar
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: item.percentage / 100,
                minHeight: 6,
                backgroundColor: Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(String name) {
    switch (name.toLowerCase()) {
      case "scratches":
        return Icons.remove;
      case "cracks":
        return Icons.bolt;
      case "corrosion":
        return Icons.water_drop_outlined;
      case "pitting":
        return Icons.hexagon_outlined;
      case "rolled-in_scale":
        return Icons.bug_report;
      case "patches":
        return Icons.bug_report;
      default:
        return Icons.bug_report;
    }
  }
}
