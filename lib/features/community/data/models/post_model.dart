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
  final List<String> likedBy;
  String? imageUrl;

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
    required this.imageUrl,
    this.likedBy = const [],
  });

  factory PostModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PostModel(
      postId: doc.id,
      postText: data['postText'] ?? '',
      username: data['username'] ?? '',
      userAvatarUrl: data['userAvatarUrl'] ?? '',
      commentsCount: data['commentsCount'] ?? 0,
      likesCount: data['likesCount'] ?? 0,
      sharesCount: data['sharesCount'] ?? 0,
      viewsCount: data['viewsCount'] ?? 0,
      createdAt: data['createdAt'] ?? Timestamp.now(),
      likedBy: List<String>.from(data['likedBy'] ?? []),
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postText': postText,
      'username': username,
      'userAvatarUrl': userAvatarUrl,
      'commentsCount': commentsCount,
      'likesCount': likesCount,
      'sharesCount': sharesCount,
      'viewsCount': viewsCount,
      'createdAt': createdAt,
      'likedBy': likedBy,
      'imageUrl': imageUrl
    };
  }
}
