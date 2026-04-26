import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final String title, id, time, zone, defects, percent;
  final IconData icon;
  final Color iconColor;

  const ActivityItem({
    super.key,
    required this.title,
    required this.id,
    required this.time,
    required this.zone,
    required this.defects,
    required this.icon,
    required this.iconColor,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    final cleanPercent = percent.replaceAll(RegExp(r'[^0-9.]'), '');
    final double accuracy = double.tryParse(cleanPercent) ?? 0.0;

    Color statusColor = accuracy >= 80
        ? Colors.green
        : (accuracy >= 50 ? Colors.orangeAccent : Colors.redAccent);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // الأيقونة
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 15),

          // المحتوى
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  id,
                  style: TextStyle(color: Colors.grey[500], fontSize: 13),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      zone,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 8),
                    dotcont(statusColor), // لون النقطة بقى ديناميكي
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        "$defects defects",
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // النسبة والوقت
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  percent,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                time,
                style: TextStyle(color: Colors.grey[400], fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget dotcont(Color color) {
  return Container(
    width: 6,
    height: 6,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );
}
