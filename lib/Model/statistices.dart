class ScanModel {
  final int passedCount;
  final int defectCount;
  final int totalDefects;
  final double accuracy;
  final double successRate;

  ScanModel({
    required this.passedCount,
    required this.defectCount,
    required this.totalDefects,
    required this.accuracy,
    required this.successRate,
  });

  factory ScanModel.fromJson(Map<String, dynamic> json) {
    return ScanModel(
      passedCount: json['passedCount'] ?? 0,
      defectCount: json['defectCount'] ?? 0,
      totalDefects: json['totalDefects'] ?? 0,
      accuracy: (json['accuracy'] as num).toDouble(),
      successRate: (json['successRate'] as num).toDouble(),
    );
  }
}