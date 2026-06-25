class Statistics {
  final int totalDefects;
  final int passedCount;
  final int defectCount;
  final double accuracy;
  final int processingTime;

  Statistics({
    required this.totalDefects,
    required this.passedCount,
    required this.defectCount,
    required this.accuracy,
    required this.processingTime,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      totalDefects: json['total_defects'],
      passedCount: json['passed_count'],
      defectCount: json['defect_count'],
      accuracy: (json['accuracy'] as num).toDouble(),
      processingTime: json['processing_time'],
    );
  }
}