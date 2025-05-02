import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/features/auth/data/models/user_model.dart';
import 'package:tamenny_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:tamenny_app/features/auth/presentation/view_model/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepoImpl) : super(AuthInitial());

  String? firstName;
  String? lasName;
  String? email;
  String? password;
  GlobalKey<FormState> signupFormKey = GlobalKey();
  GlobalKey<FormState> loginFormKey = GlobalKey();
  bool obsecure = false;
  final AuthRepoImpl _authRepoImpl;

  signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());

      final user = await _authRepoImpl.registerUser(
        name: '${firstName}${lasName}',
        email: email!,
        password: password!,
      );

      if (user != null) {
        emit(SignUpSuccessState(user: user));
      } else {
        emit(SignUpFailureState(errMessage: 'حدث خطأ أثناء إنشاء الحساب.'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState(
            errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(
            errMessage: 'The email address is already in use.'));
      } else {
        emit(SignUpFailureState(
            errMessage: 'An unknown error occurred: ${e.message}'));
      }
    } catch (e) {
      emit(SignUpFailureState(
          errMessage: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  loginWithEmailAndPassword() async {
    try {
      emit(LogInLoadingState());

      final user = await _authRepoImpl.loginUser(
        email: email!,
        password: password!,
      );

      if (user != null) {
        await verifyAccount();
        emit(LogInSuccessState(user: user));
      } else {
        emit(LogInFailureState(errMessage: 'حدث خطأ أثناء تسجيل الدخول.'));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LogInFailureState(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LogInFailureState(
            errMessage: 'Wrong password provided for that user.'));
      } else if (e.code == 'too-many-requests') {
        emit(LogInFailureState(
            errMessage:
                'Too many unsuccessful attempts. Please try again later.'));
      } else {
        emit(LogInFailureState(
            errMessage: 'An unknown error occurred: ${e.message}'));
      }
    } catch (e) {
      emit(LogInFailureState(
          errMessage: 'An unexpected error occurred: ${e.toString()}'));
    }
  }

  verifyAccount() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  resetPassword() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
  }

  Future<UserModel?> getUserData() async {
    return await _authRepoImpl
        .getUserData(FirebaseAuth.instance.currentUser!.uid);
  }

  changeObsecureState() {
    obsecure = !obsecure;
    emit(ObsecureTextState());
  }
}
