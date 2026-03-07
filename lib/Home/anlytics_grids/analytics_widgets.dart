import 'package:defectscan/constants/colors/colors.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title, value, trend;
  final Color color, iconscolor, avatarcolor;
  final IconData icondata;
  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.trend,
    required this.color,

    required this.icondata,
    required this.iconscolor,
    required this.avatarcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 27,
                backgroundColor: avatarcolor,
                child: Center(
                  child: Icon(icondata, size: 40, color: iconscolor),
                ),
              ),
              Text(
                trend,
                style: TextStyle(
                  color: Mycolors.org,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            title,
            style: TextStyle(
              color: Mycolors.org,

              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Mycolors.org,

              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

Widget mylisttile(IconData icondata, String title, String subtitle) {
  return Card(
    color: Colors.white,
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Mycolors.org,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
      leading: Icon(icondata, color: Mycolors.org),
    ),
  );
}