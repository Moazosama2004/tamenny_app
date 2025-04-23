import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:tamenny_app/features/community/presentation/manager/post_cubit/post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  Future<void> postNow({
    required String postText,
    required String privacy,
    required File? selectedImage,
  }) async {
    try {
      emit(PostLoading());

      // String? imageUrl;
      // if (selectedImage != null) {
      //   imageUrl = await _uploadImageToStorage(selectedImage);
      // }

      await FirebaseFirestore.instance.collection('posts').add({
        'userId': 'uid_001',
        'username': 'Muaz Osama',
        'userAvatarUrl':
            'https://scontent.fcai21-4.fna.fbcdn.net/v/t39.30808-1/480736065_1351844645997522_5916626625746172420_n.jpg?stp=dst-jpg_s160x160_tt6&_nc_cat=101&ccb=1-7&_nc_sid=e99d92&_nc_ohc=4wz_eaDqd4kQ7kNvwHrwSPJ&_nc_oc=AdlMaHRWgrRiJv_XJABvv7rEHhH0UVcQR8c6RL8BZ8Epk6K0Jc5YUhu2m0_0dTSQj_8&_nc_zt=24&_nc_ht=scontent.fcai21-4.fna&_nc_gid=gIQhb3nW74V93UB5lyZ6Gg&oh=00_AfHLm3Dcmd-kEtuz55qNL5wSJOB5-N8r9f0c_hfaTInHww&oe=68061E05',
        'createdAt': Timestamp.now(),
        'postText': postText.trim(),
        'privacy': privacy,
        'commentsCount': 0,
        'likesCount': 0,
        'sharesCount': 0,
        'viewsCount': 0,
        // 'imageUrl': imageUrl,
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
