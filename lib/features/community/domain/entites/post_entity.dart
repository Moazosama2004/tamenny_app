import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tamenny_app/features/community/domain/entites/comment_entity.dart';

class PostEntity {
  final String userAvatarUrl;
  final String username;
  final Timestamp createdAt;
  final String postText;
  String? imageUrl;
  final int commentsCount;
  final int likesCount;
  final int sharesCount;
  final List<CommentEntity>? comments;

  PostEntity({
    required this.userAvatarUrl,
    required this.username,
    required this.createdAt,
    required this.postText,
    required this.commentsCount,
    required this.likesCount,
    required this.sharesCount,
    this.comments,
    this.imageUrl,
  });
}
