import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamenny_app/features/community/data/models/post_model.dart';
import 'package:tamenny_app/features/community/presentation/manager/community_cubit/community_cubit.dart';
import 'package:tamenny_app/features/community/presentation/views/widgets/post_actions.dart';

import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/utils/app_assets.dart';

class Post extends StatelessWidget {
  const Post({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final communityCubit = context.read<CommunityCubit>();
    final isLiked = communityCubit.isPostLiked(post);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            18,
          ),
          border: Border.all(
            color: const Color(0xffEEEEEE),
          )),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(
                          post.userAvatarUrl), // Dynamic avatar URL
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      post.username, // Dynamic username
                      style: AppStyles.font13Bold,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      _getTimeAgo(post.createdAt), // Dynamic time ago
                      style: AppStyles.font13Bold,
                    ),
                  ],
                ),
                SvgPicture.asset(Assets.imagesMoreOptionIcon)
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              post.postText, // Dynamic post text
              style: AppStyles.font12Regular,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 18,
            ),
            PostActions(
              commentsCount:
                  post.commentsCount, // Passing dynamic comments count
              likesCount: post.likesCount, // Passing dynamic likes count
              sharesCount: post.sharesCount, // Passing dynamic shares count
              viewsCount: post.viewsCount, // Passing dynamic views count
              isLiked: isLiked,
              onLikePressed: () => communityCubit.toggleLike(post.postId),
            ),
          ],
        ),
      ),
    );
  }

  String _getTimeAgo(Timestamp timestamp) {
    // A simple method to convert the Firebase timestamp to a human-readable time ago string
    final DateTime dateTime = timestamp.toDate();
    final Duration difference = DateTime.now().difference(dateTime);
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${(difference.inDays / 7).floor()} weeks ago';
    }
  }
}
