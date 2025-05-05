import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tamenny_app/features/community/domain/entites/post_entity.dart';
import 'package:tamenny_app/features/home/domain/entites/article_entity.dart';

final List<PostEntity> dummyPosts = [
  PostEntity(
      postText: 'This is a sample post text.',
      username: 'john_doe',
      userAvatarUrl: 'https://example.com/avatar.jpg',
      commentsCount: 10,
      likesCount: 100,
      sharesCount: 5,
      createdAt: Timestamp.now(),
      imageUrl: ''),
  PostEntity(
      postText: 'This is a sample post text.',
      username: 'john_doe',
      userAvatarUrl: 'https://example.com/avatar.jpg',
      commentsCount: 10,
      likesCount: 100,
      sharesCount: 5,
      createdAt: Timestamp.now(),
      imageUrl: ''),
  PostEntity(
      postText: 'This is a sample post text.',
      username: 'john_doe',
      userAvatarUrl: 'https://example.com/avatar.jpg',
      commentsCount: 10,
      likesCount: 100,
      sharesCount: 5,
      createdAt: Timestamp.now(),
      imageUrl: ''),
  PostEntity(
      postText: 'This is a sample post text.',
      username: 'john_doe',
      userAvatarUrl: 'https://example.com/avatar.jpg',
      commentsCount: 10,
      likesCount: 100,
      sharesCount: 5,
      createdAt: Timestamp.now(),
      imageUrl: ''),
  PostEntity(
      postText: 'This is a sample post text.',
      username: 'john_doe',
      userAvatarUrl: 'https://example.com/avatar.jpg',
      commentsCount: 10,
      likesCount: 100,
      sharesCount: 5,
      createdAt: Timestamp.now(),
      imageUrl: ''),
  PostEntity(
      postText: 'This is a sample post text.',
      username: 'john_doe',
      userAvatarUrl: 'https://example.com/avatar.jpg',
      commentsCount: 10,
      likesCount: 100,
      sharesCount: 5,
      createdAt: Timestamp.now(),
      imageUrl: '')
];
