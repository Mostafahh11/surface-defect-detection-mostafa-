class Prediction {
  final String defectClass;
  final double confidence;
  final int detectioncount;

  final double defectPercentage;
  final List bbox;

  Prediction({
    required this.defectClass,
    required this.confidence,
    required this.detectioncount,
    required this.defectPercentage,
    required this.bbox,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      defectClass: json['class'],
      confidence: (json['confidence'] as num).toDouble(),
      detectioncount: (json['detections_count'] )?? 1,
      defectPercentage: (json['defect_percentage'] as num).toDouble(),
      bbox: List.from(json['bbox']),
    );
  }
}