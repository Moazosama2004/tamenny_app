import 'package:tamenny_app/features/scan/domain/entites/diagnosis_result_entity.dart';

class DiagnosisResultModel {
  final String classification;
  final double confidence;

  DiagnosisResultModel({
    required this.classification,
    required this.confidence,
  });

  DiagnosisResultEntity toEntity() {
    return DiagnosisResultEntity(
      classification: classification,
      confidence: confidence,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'classification': classification,
      'confidence': confidence,
    };
  }

  factory DiagnosisResultModel.fromJson(Map<String, dynamic> json) {
    return DiagnosisResultModel(
      classification: json['classification'],
      confidence: json['confidence'].toDouble(),
    );
  }

  factory DiagnosisResultModel.fromEntity(DiagnosisResultEntity entity) {
    return DiagnosisResultModel(
      classification: entity.classification,
      confidence: entity.confidence,
    );
  }
}
