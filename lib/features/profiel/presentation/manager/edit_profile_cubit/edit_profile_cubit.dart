import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:tamenny_app/core/cubits/user_cubit/user_cubit.dart';
import 'package:tamenny_app/core/services/database_service.dart';
import 'package:tamenny_app/core/services/get_it_service.dart';
import 'package:tamenny_app/core/services/storage_service.dart';
import 'package:tamenny_app/features/auth/data/models/user_model.dart';
import 'package:tamenny_app/features/profiel/presentation/manager/edit_profile_cubit/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.storageService, this.databaseService)
      : super(EditProfileInitial());

  final StorageService storageService;
  final DatabaseService databaseService;

  final ImagePicker _picker = ImagePicker();
  final userCubit = getIt<UserCubit>();

  Future<void> editProfileAvatar(String userId, XFile file) async {
    try {
      emit(EditProfileLoading());

      String fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';
      String path = 'avatars/$fileName';

      final imageUrl = await storageService.uploadFile(file: file, path: path);
      await databaseService.updateUserAvatar(
          userId: userId, imageUrl: imageUrl);

      final userBox = Hive.box<UserModel>('user');
      final currentUser = userBox.get('currentUser');

      if (currentUser != null) {
        final updatedUser = currentUser.copyWith(userAvatarUrl: imageUrl);
        await userBox.put('currentUser', updatedUser);
        userCubit.saveUser(updatedUser);
      }
      emit(EditProfileSuccess(imageUrl));
    } catch (e) {
      emit(EditProfileError(e.toString()));
    }
  }
}
