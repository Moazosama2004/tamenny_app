import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/config/cache_helper.dart';
import 'package:tamenny_app/constants.dart';
import 'package:tamenny_app/core/functions/get_user_entity.dart';
import 'package:tamenny_app/features/auth/data/models/user_model.dart';
import 'package:tamenny_app/features/auth/domain/entites/user_entity.dart';

class UserCubit extends Cubit<UserEntity> {
  UserCubit() : super(getUserEntitiy()); // تحميل البيانات من SharedPrefs

  void updateImageUrl(String newImageUrl) {
    // 1. حدّث الـ user
    final updatedUser = state.copyWith(imageUrl: newImageUrl);

    // 2. خزّنها في SharedPreferences
    final updatedJson = jsonEncode(UserModel.fromEntity(updatedUser).toJson());
    CacheHelper.set(key: kUserData, value: updatedJson);

    // 3. Emit التحديث الجديد
    emit(updatedUser);
  }
}
