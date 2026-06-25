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
      padding: EdgeInsets.only(bottom: isLast ? 0 : 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                ),
                child: Icon(_getIcon(item.name), size: 25),
              ),
              const SizedBox(width: 16),

              
              Expanded(
                child: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic, 
                  ),
                ),
              ),

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

              SizedBox(
                width: 42,
                child: Text(
                  "${item.percentage.toStringAsFixed(0)}%",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

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
        return Icons.auto_awesome_motion_outlined;

      case "corrosion":
        return Icons.blur_on;

      case "pitting":
        return Icons.grid_3x3;

      case "rolled-in_scale":
        return Icons.texture;
      case "patches":
        return Icons.crop_square_sharp;

      default:
        return Icons.error_outline;
    }
  }
}
