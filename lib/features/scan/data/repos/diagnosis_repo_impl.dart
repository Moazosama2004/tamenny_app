import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:tamenny_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:tamenny_app/core/errors/failure.dart';
import 'package:tamenny_app/core/services/ai_diagnosis_service.dart';
import 'package:tamenny_app/core/services/database_service.dart';
import 'package:tamenny_app/core/services/get_it_service.dart';
import 'package:tamenny_app/core/utils/backend_end_point.dart';
import 'package:tamenny_app/features/scan/data/models/diagnosis_result_model.dart';
import 'package:tamenny_app/features/scan/domain/entites/diagnosis_result_entity.dart';
import 'package:tamenny_app/features/scan/domain/repos/diagnosis_repo.dart';

class DiagnosisRepoImpl extends DiagnosisRepo {
  final AIDiagnosisService aiDiagnosisService;
  final DatabaseService databaseService;

  DiagnosisRepoImpl(this.aiDiagnosisService, this.databaseService);

  @override
  Future<Either<Failure, DiagnosisResultEntity>> startDiagnosis(
      {required File image}) async {
    try {
      Map<String, dynamic> result =
          await aiDiagnosisService.kneeDiagnosis(imageFile: image);
      print("Diagnosis Result: $result");

      if (getIt<UserCubit>().currentUser == null) {
        return left(ServerFailure(errMessage: 'User not signed in'));
      }

      await addDiagnosisToFireStore(
        userId: getIt<UserCubit>().currentUser!.uId,
        diagnosis: result,
      );

      return right(DiagnosisResultModel.fromJson(result).toEntity());
    } catch (e) {
      print("Error in Diagnosis: $e");
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<void> addDiagnosisToFireStore(
      {required String userId, required Map<String, dynamic> diagnosis}) async {
    try {
      await databaseService.updateData(
        path: BackendEndPoint.addDiagnosis,
        documentId: userId,
        data: diagnosis,
      );

      await databaseService.updateData(
        path: BackendEndPoint.addDiagnosis,
        documentId: userId,
        data: {
          'diagnoses': FieldValue.arrayUnion([diagnosis]),
        },
      );
    } catch (e) {
      print("Error adding diagnosis to Firestore: $e");
      rethrow;
    }
  }
}
