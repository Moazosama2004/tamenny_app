import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tamenny_app/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  // تسجيل مستخدم جديد
  Future<UserModel?> registerUser({
    required String name,
    required String email,
    required String password,
  });

  // تسجيل الدخول
  Future<UserModel?> loginUser({
    required String email,
    required String password,
  });

  // حفظ بيانات المستخدم
  Future<void> saveUserData(UserModel user);

  Future<UserModel?> getUserData(String uid);

  // تسجيل الخروج
  Future<void> logout();
}
