import 'package:defectscan/Model/scansmodel/image.dart';
import 'package:defectscan/Model/scansmodel/pridectionmodel.dart';
import 'package:defectscan/Model/scansmodel/statistices.dart';

class DefectData {
  final Prediction pre;
  final DefectImage image;
  final Statistics statistics;

  DefectData({
    required this.pre,
    required this.image,
    required this.statistics,
  });

  factory DefectData.fromJson(Map<String, dynamic> json) {
    return DefectData(
      pre: Prediction.fromJson(json['prediction']),
      image: DefectImage.fromJson(json['image']),
      statistics: Statistics.fromJson(json['statistics']),
    );
  }
}