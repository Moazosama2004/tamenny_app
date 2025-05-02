import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String postId;
  final String postText;
  final String username;
  final String userAvatarUrl;
  final int commentsCount;
  final int likesCount;
  final int sharesCount;
  final int viewsCount;
  final Timestamp createdAt;

  PostModel({
    required this.postId,
    required this.postText,
    required this.username,
    required this.userAvatarUrl,
    required this.commentsCount,
    required this.likesCount,
    required this.sharesCount,
    required this.viewsCount,
    required this.createdAt,
  });

  factory PostModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PostModel(
      postId: data['postId'] ?? '',
      postText: data['postText'] ?? '',
      username: data['username'] ?? '',
      userAvatarUrl: data['userAvatarUrl'] ?? '',
      commentsCount: data['commentsCount'] ?? 0,
      likesCount: data['likesCount'] ?? 0,
      sharesCount: data['sharesCount'] ?? 0,
      viewsCount: data['viewsCount'] ?? 0,
      createdAt: data['createdAt'] ?? Timestamp.now(),
    );
  }
}
