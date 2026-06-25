class DefectImage {
  final int id;
  final int scanId;
  final String imagePath;
  final String processedImagePath;
  final int fileSize;
  final String resolution;
  final String annotatedImage;

  DefectImage({
    required this.id,
    required this.scanId,
    required this.imagePath,
    required this.processedImagePath,
    required this.fileSize,
    required this.resolution,
    required this.annotatedImage,
  });

  factory DefectImage.fromJson(Map<String, dynamic> json) {
    return DefectImage(
      id: json['id'],
      scanId: json['scan_id'],
      imagePath: json['image_path'],
      processedImagePath: json['processed_image_path'],
      fileSize: json['file_size'],
      resolution: json['resolution'],
      annotatedImage: json['annotated_image'],
    );
  }
}