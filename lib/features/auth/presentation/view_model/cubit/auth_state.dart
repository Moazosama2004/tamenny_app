import 'package:tamenny_app/features/auth/data/models/user_model.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpSuccessState extends AuthState {
  final UserModel user;

  SignUpSuccessState({required this.user});
}

final class SignUpFailureState extends AuthState {
  final String errMessage;

  SignUpFailureState({required this.errMessage});
}

final class LogInLoadingState extends AuthState {}

final class LogInSuccessState extends AuthState {
  final UserModel user;

  LogInSuccessState({required this.user});
}

final class LogInFailureState extends AuthState {
  final String errMessage;

  LogInFailureState({required this.errMessage});
}

final class ObsecureTextState extends AuthState {}
