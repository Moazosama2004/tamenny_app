class DiagnosisState {}

final class DiagnosisInitial extends DiagnosisState {}

final class DiagnosisLoading extends DiagnosisState {}

final class DiagnosisSuccess extends DiagnosisState {}

final class DiagnosisFailure extends DiagnosisState {
  final String errMessage;

  DiagnosisFailure({required this.errMessage});
}
