import 'package:defectscan/controller/statistics%20cont/stat.dart';
import 'package:flutter/material.dart';

// ==========================================
// 1. Quick Insights Widget (مطابق للصورة)
// ==========================================
class QuickInsightsWidget extends StatelessWidget {
  final double accuracy;
  final int totalScans;

  const QuickInsightsWidget({
    super.key,
    required this.accuracy,
    required this.totalScans,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // حساب المتبقي للهدف اليومي (افتراضي 60)
    int remaining = (60 - totalScans) > 0 ? 60 - totalScans : 0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[800]! : Colors.grey.shade200,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان القسم
          Row(
            children: [
              Icon(
                Icons.trending_up,
                color: isDark ? Colors.white : Colors.black87,
                size: 26,
              ),
              const SizedBox(width: 10),
              Text(
                "Quick insights",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // البصيرة الأولى: أفضل أداء
          _buildInsightRow(
            context: context,
            icon: Icons.workspace_premium_outlined,
            iconColor: Colors.orangeAccent,
            title: "Best performance",
            subtitle:
                "You've achieved $accuracy% accuracy this week\nYour best record!",
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(
              color: isDark ? Colors.grey[800] : Colors.grey.shade200,
            ),
          ),

          // البصيرة الثانية: الهدف اليومي
          _buildInsightRow(
            context: context,
            icon: Icons.track_changes_outlined,
            iconColor: Colors.greenAccent.shade400,
            title: "Daily goal progress",
            subtitle:
                "$remaining more scans to reach your 60-scan target\nfor today",
          ),
        ],
      ),
    );
  }

  Widget _buildInsightRow({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: iconColor.withOpacity(0.5), width: 1.5),
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ==========================================
// 2. Stat Card Grid Widget (مطابق للصورة)
// ==========================================
class StatCardWidget extends StatelessWidget {
  final StatCardData data;

  const StatCardWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // تحديد لون نسبة التغير (أحمر لو سالب، أسود لو موجب)
    bool isNegative = data.trend.startsWith('-');
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: data.color, // الألوان القادمة من الكنترولر يفضل تكون باستيل
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الأيقونة بخلفية أغمق قليلاً من لون الكارت
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.black.withOpacity(0.05),
                child: Icon(data.icondata, color: Colors.black87, size: 24),
              ),
              // نسبة التغير
              Text(
                data.trend,
                style: TextStyle(
                  color: isNegative
                      ? Colors.red.shade700
                      : (isDark ? Colors.white : Colors.black87),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان
              Text(
                data.title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              // القيمة الكبيرة
              Text(
                data.value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
