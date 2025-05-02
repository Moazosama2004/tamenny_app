import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:tamenny_app/core/services/database_service.dart';
import 'package:tamenny_app/core/services/storage_service.dart';
import 'package:tamenny_app/features/profiel/presentation/manager/edit_profile_cubit/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.storageService, this.databaseService)
      : super(EditProfileInitial());

  final StorageService storageService;
  final DatabaseService databaseService;

  final ImagePicker _picker = ImagePicker();

  Future<void> editProfileAvatar(String userId, XFile file) async {
    try {
      emit(EditProfileLoading());

      String fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';

      String path = 'avatars/$fileName';

      final imageUrl = await storageService.uploadFile(file: file, path: path);
      await databaseService.updateUserAvatar(
          userId: userId, imageUrl: imageUrl);

      emit(EditProfileSuccess(imageUrl));
    } catch (e) {
      emit(EditProfileError(e.toString()));
    }
  }
}
