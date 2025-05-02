import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tamenny_app/core/functions/get_user_entity.dart';
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

  Future<void> toggleLike(String postId) async {
    try {
      final currentUser = getUserEntitiy();

      // Optimistically update the UI first
      if (state is CommunitySuccess) {
        final currentState = state as CommunitySuccess;
        final post = currentState.posts.firstWhere((p) => p.postId == postId);
        final bool isCurrentlyLiked = post.likedBy.contains(currentUser.uId);

        // Create updated likedBy list
        final List<String> updatedLikedBy = List.from(post.likedBy);
        if (isCurrentlyLiked) {
          updatedLikedBy.remove(currentUser.uId);
        } else {
          updatedLikedBy.add(currentUser.uId);
        }

        // Update the post in the UI immediately
        final updatedPosts = currentState.posts.map((p) {
          if (p.postId == postId) {
            return PostModel(
              postId: p.postId,
              postText: p.postText,
              username: p.username,
              userAvatarUrl: p.userAvatarUrl,
              commentsCount: p.commentsCount,
              likesCount: updatedLikedBy.length,
              sharesCount: p.sharesCount,
              viewsCount: p.viewsCount,
              createdAt: p.createdAt,
              likedBy: updatedLikedBy,
            );
          }
          return p;
        }).toList();

        // Emit the updated state immediately
        emit(CommunitySuccess(updatedPosts));
      }

      // Then update Firestore in the background
      final postRef = _firestore.collection('posts').doc(postId);
      final postDoc = await postRef.get();

      if (!postDoc.exists) return;

      final post = PostModel.fromFirestore(postDoc);
      final List<String> updatedLikedBy = List.from(post.likedBy);
      final bool isLiked = updatedLikedBy.contains(currentUser.uId);

      if (isLiked) {
        updatedLikedBy.remove(currentUser.uId);
      } else {
        updatedLikedBy.add(currentUser.uId);
      }

      await postRef.update({
        'likedBy': updatedLikedBy,
        'likesCount': updatedLikedBy.length,
      });
    } catch (e) {
      // If there's an error, revert to the original state
      getPosts();
      emit(CommunityFailure(e.toString()));
    }
  }

  bool isPostLiked(PostModel post) {
    final currentUser = getUserEntitiy();
    return post.likedBy.contains(currentUser.uId);
  }
}
