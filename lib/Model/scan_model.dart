class ScanModel {
  final int id;
  final int userId;
  final String status;
  final String scanType;
  final DateTime createdAt;

  ScanModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.scanType,
    required this.createdAt,
  });

  factory ScanModel.fromJson(Map<String, dynamic> json) {
    return ScanModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      status: json['status'] ?? 'pending',
      scanType: json['scan_type'] ?? 'unknown',
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'status': status,
      'scan_type': scanType,
      'created_at': createdAt.toIso8601String(),
    };
  }
}