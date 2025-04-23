import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tamenny_app/features/community/data/models/post_model.dart';
import 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  final FirebaseFirestore _firestore;

  CommunityCubit(this._firestore) : super(CommunityInitial());

  void getPosts() async {
    emit(CommunityLoading());
    try {
      final snapshot = await _firestore
          .collection('posts')
          .orderBy('createdAt', descending: true)
          .get();
      final posts =
          snapshot.docs.map((doc) => PostModel.fromFirestore(doc)).toList();
      emit(CommunitySuccess(posts));
    } catch (e) {
      emit(CommunityFailure(e.toString()));
    }
  }
}
