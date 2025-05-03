import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamenny_app/config/cache_helper.dart';
import 'package:tamenny_app/core/functions/get_user_entity.dart';
import 'dart:io';

import 'package:tamenny_app/features/community/presentation/manager/post_cubit/post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  Future<void> postNow({
    required String postText,
    required String privacy,
    File? selectedImage,
    String? imageUrl,
  }) async {
    try {
      emit(PostLoading());

      // String? imageUrl;
      // if (selectedImage != null) {
      //   imageUrl = await _uploadImageToStorage(selectedImage);
      // }

      await FirebaseFirestore.instance.collection('posts').add({
        'userId': 'uid_001',
        'username': getUserEntitiy().name,
        'userAvatarUrl': getUserEntitiy().userAvatarUrl,
        'createdAt': Timestamp.now(),
        'postText': postText.trim(),
        'privacy': privacy,
        'commentsCount': 0,
        'likesCount': 0,
        'sharesCount': 0,
        'viewsCount': 0,
        'imageUrl': imageUrl,
      });

      emit(PostSuccess());
    } catch (e) {
      emit(PostFailure(error: e.toString()));
    }
  }

  // Future<String?> _uploadImageToStorage(File imageFile) async {
  //   final ref = FirebaseStorage.instance
  //       .ref()
  //       .child('posts')
  //       .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

  //   await ref.putFile(imageFile);
  //   return await ref.getDownloadURL();
  // }
}
