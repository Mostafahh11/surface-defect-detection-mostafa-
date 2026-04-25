import 'package:flutter/material.dart';
import 'package:defectscan/constants/colors/colors.dart'; // عشان نستخدم Mycolors.org

class DefectCategoryRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String cases;
  final double percentage;

  const DefectCategoryRow({
    super.key,
    required this.icon,
    required this.label,
    required this.cases,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    Color progressColor = percentage > 0.7
        ? Colors.redAccent
        : (percentage > 0.4 ? Mycolors.org : Colors.blueAccent);

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              // Icon Container
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 28,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(width: 15),

              // Label
              Expanded(
                flex: 3,
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Cases Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isDark ? Colors.grey[800] : Colors.grey[200],
                ),
                child: Text(
                  '$cases cases',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.grey[300] : Colors.black54,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Percentage Text
              Text(
                '${(percentage * 100).clamp(0, 100).toInt()}%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: progressColor, // اللون بيتبع حالة الخطورة
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Progress Indicator المحسن
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percentage.clamp(0.0, 1.0), // Null Safety & Range check
              backgroundColor: isDark ? Colors.grey[900] : Colors.grey[100],
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
