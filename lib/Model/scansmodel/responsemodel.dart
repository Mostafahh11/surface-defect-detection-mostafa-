import 'package:defectscan/Model/scansmodel/datamodel.dart';

class DefectResponse {
  final bool status;
  final bool success;
  final String message;
  final DefectData data;

  DefectResponse({
    required this.status,
    required this.success,
    required this.message,
    required this.data,
  });

  factory DefectResponse.fromJson(Map<String, dynamic> json) {
    return DefectResponse(
      status: json['status'],
      success: json['success'],
      message: json['message'],
      data: DefectData.fromJson(json['data']),
    );
  }
}