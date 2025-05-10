import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:tamenny_app/features/scan/domain/entites/diagnosis_result_entity.dart';
import 'package:tamenny_app/features/scan/domain/repos/diagnosis_repo.dart';
import 'package:tamenny_app/features/scan/presentation/manager/cubit/dianosis_state.dart';

class DiagnosisCubit extends Cubit<DiagnosisState> {
  DiagnosisCubit(this.diagnosisRepo) : super(DiagnosisInitial());

  final DiagnosisRepo diagnosisRepo;

  late DiagnosisResultEntity diagnosisResultEntity;

  startDiagnosis({required File image}) async {
    emit(DiagnosisLoading());

    var result = await diagnosisRepo.startDiagnosis(image: image);
    result.fold((f) => emit(DiagnosisFailure(errMessage: f.errMessage)),
        (data) {
      diagnosisResultEntity = data;
      emit(DiagnosisSuccess());
    });
  }
}
