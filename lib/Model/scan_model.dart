class ScanModel {
  final String originalImagePath; 
  final String processedImage;   
  final String defectType;
  final double confidence;

  ScanModel({
    required this.originalImagePath,
    required this.processedImage,
    required this.defectType,
    required this.confidence,
  });
}