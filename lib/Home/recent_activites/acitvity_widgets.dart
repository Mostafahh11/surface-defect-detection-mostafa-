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
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 2),
        ],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 30),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  id,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 15,
                      color: Colors.orange,
                    ),
                    Text(
                      " Zone $zone ",
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    dotcont(iconColor),
                    Text(
                      "   $defects defects",
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "$percent%",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                time,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
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
    width: 7,
    height: 7,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(7),
      color: color,
    ),
  );
}
