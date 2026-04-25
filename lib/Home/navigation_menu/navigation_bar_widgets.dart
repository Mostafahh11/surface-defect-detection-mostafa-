import 'package:flutter/material.dart';

Widget buildWebNavItem({
  required IconData icon,
  required String label,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          // مهم جداً عشان الـ Column ما ياخدش مساحة الشاشة كلها بالطول
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.blueGrey,
              size: 22, // كبّرنا الحجم شوية للموبايل
            ),
            const SizedBox(height: 4), // تغيير لـ height لأننا جوه Column
            Text(
              label,
              style: TextStyle(
                fontSize: 11, // حجم مناسب للـ Dock
                color: isSelected ? Colors.white : Colors.blueGrey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
