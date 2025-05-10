import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tamenny_app/core/errors/failure.dart';
import 'package:tamenny_app/features/scan/domain/entites/diagnosis_result_entity.dart';

abstract class DiagnosisRepo {
  Future<Either<Failure, DiagnosisResultEntity>> startDiagnosis(
      {required File image});
  Future addDiagnosisToFireStore(
      {required String userId, required Map<String, dynamic> diagnosis});
}
