class ScanDetailsEntity {
  final String analysisTitle; // e.g., 'Lung Disease Analysis'
  final String analysisType;
  final String analysisGuidanceMessages;
  // final String status; // e.g., 'normal', 'moderate', 'critical'
  // final String resultDescription;
  // final List<String> adviceList;
  // final DateTime scannedAt;
  // final double? confidenceScore; // optional
  // final String? modelName; // optional
  // final String? scanImageUrl; // optional if saved

  const ScanDetailsEntity({
    required this.analysisTitle,
    required this.analysisType,
    required this.analysisGuidanceMessages,
    // required this.status,
    // required this.resultDescription,
    // required this.adviceList,
    // required this.scannedAt,
    // this.confidenceScore,
    // this.modelName,
    // this.scanImageUrl,
  });
}
