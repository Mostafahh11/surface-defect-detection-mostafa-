class RecentActivityModel {
  final int scanId;
  final String scanType;
  final String status;
  final int totalImages;
  final int totalDefects;
  final String createdAt;

  RecentActivityModel({
    required this.scanId,
    required this.scanType,
    required this.status,
    required this.totalImages,
    required this.totalDefects,
    required this.createdAt,
  });

  // لتحويل الـ JSON اللي جاي من الـ API إلى كائن (Object) من الموديل
  factory RecentActivityModel.fromJson(Map<String, dynamic> json) {
    return RecentActivityModel(
      scanId: json['scanId'] ?? 0,
      scanType: json['scanType'] ?? '',
      status: json['status'] ?? '',
      totalImages: json['totalImages'] ?? 0,
      totalDefects: json['totalDefects'] ?? 0,
      createdAt: json['createdAt'] ?? '',
    );
  }

  // لتحويل الكائن (Object) إلى JSON لو هتبعته للـ API
  Map<String, dynamic> toJson() {
    return {
      'scanId': scanId,
      'scanType': scanType,
      'status': status,
      'totalImages': totalImages,
      'totalDefects': totalDefects,
      'createdAt': createdAt,
    };
  }

  // دالة مساعدة لو الداتا جاية في شكل List (مصفوفة) زي ما هو واضح في الكود بتاعك
  static List<RecentActivityModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => RecentActivityModel.fromJson(json)).toList();
  }
}